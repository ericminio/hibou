class ChildrenController < ApplicationController
  respond_to :html

  def index
    @children = Child.all
    respond_with @children
  end

  def show
    @child = Child.find(params[:id])

    respond_with(@child) do |format|
      format.pdf { render :pdf => ChildFile.new(@child, :at => [0, 612]), :filename => "#{@child.to_param}.pdf", :disposition => 'inline' }
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
    @child.update_attributes(params[:child])
    respond_with @child
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    respond_with @child
  end
end
