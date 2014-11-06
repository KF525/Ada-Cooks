class UsersController < ActiveRecord::Base

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :username, :email, :password, :password_confirmation))
    if @user.save
      redirect_to recipes
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end
end
