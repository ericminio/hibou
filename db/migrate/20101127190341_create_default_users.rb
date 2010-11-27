class CreateDefaultUsers < ActiveRecord::Migration
  @accounts_info = [['cpn.directrice@videotron.ca','karlito'],['cpn.reception@videotron.ca','marina'],['cpn.halte@videotron.ca','5poupous']]
  def self.up
    @accounts_info.each do |email, password|
      User.create :email => email, :password => password, :password_confirmation => password
    end
  end

  def self.down
    @accounts_info.each do |email, password|
      User.where("email = #{email}").destroy
    end
  end
end
