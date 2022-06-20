class GroupsController < ApplicationController
  def new
    @group = Group.new
  end  
  
  def index
    @book = Book.new
    @groups = Group.all
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def create
    group = Group.new(group_params)
    group.save
    redirect_to groups_path
  end
  
  def destroy
  end  
  
  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to groups_path
  end  
  
  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end  
end
