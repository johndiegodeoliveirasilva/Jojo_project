class UsersController < ApplicationController

  before_action :user_find, only: %i[show edit update]
  def index
    @user = User.all

    respond_to do |format|
      format.html
    end
  end
  
  def show; end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :admin)
  end
  
  def user_find
    @user = User.find(params[:id])
  end
end