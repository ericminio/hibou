require 'spec_helper'

describe Family do
  subject { Family.new }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:sin) }
  it { should validate_uniqueness_of(:sin)  }
  it { should have_one(:address) }
  it { should have_many(:children) }
end
