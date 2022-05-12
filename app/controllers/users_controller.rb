class UsersController < ApplicationController
  load_and_authorize_resource
  layout "admin"
  
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @pagy, @users = pagy(User.all)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(:email => params[:user][:email], :password => params[:user][:password], 
      :first_name => params[:user][:first_name], :last_name => params[:user][:last_name],
      :birtday => params[:user][:birtday], :exam_id => params[:user][:exam_id]
    )
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end

  def edit
    set_user
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      flash[:danger] = "Update failed"
      redirect_to "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:alert] = "user has been deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email => params[:user][:email], :password => params[:user][:password], 
      :first_name => params[:user][:first_name], :last_name => params[:user][:last_name],
      :birtday => params[:user][:birtday], :exam_id => params[:user][:exam_id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
