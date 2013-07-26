class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :authorized_user, only: [:edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Updated account"
      sign_in @user # Session token gets reset after update, needs to set again
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)    
    end

    def signed_in_user
      redirect_to sign_in_path, notice: "Need to be logged in" unless signed_in?
    end

    def authorized_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
end
