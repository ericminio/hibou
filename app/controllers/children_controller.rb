class ChildrenController < ApplicationController

  respond_to :html

  def index
    @children = Child.all
    respond_with @children
  end

  def show
    @child = Child.find(params[:id])

    respond_with(@child) do |format|
      format.pdf {
        send_data(ChildFile.render_for(@child),
                  :type       =>"application/pdf",
                  :filename   => "#{@child.first_name}_#{@child.last_name}.pdf",
                  :disposition=>"attachment"
        )
      }
    end
  end

  def new
    @child = Child.new
    respond_with @child
  end

  def edit
    @child = Child.find(params[:id])
    respond_with @child
  end

  def create
    @child = Child.create(params[:child])
    respond_with @child
  end

  def update
    @child = Child.find(params[:id])
    respond_with @child
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    respond_with @child
  end
end
