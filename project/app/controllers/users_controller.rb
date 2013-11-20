class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user
      @user
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the user' }
    end
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'

    @user = User.find_by_id(params[:id])
    if @user
      @user
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the user' }
    end

    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'

    @user = User.find_by_id(params[:id])
    if @user
      @user
    else
      redirect_to root_path, :flash => { :notice => 'ERROR - Can not find the user' }
    end

    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end