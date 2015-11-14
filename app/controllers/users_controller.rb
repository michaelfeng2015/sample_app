class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "恭喜您！成功加入搞基大家庭！"
      redirect_to @user
    else
      render 'new'
      # flash[:danger] = "恭喜您！成功加入搞基大家庭！"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "您的资料更新了！"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  # 事前动作
  # 确保用户已登录
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "您还没登陆！"
      redirect_to login_url
    end
  end
  # 确保是正确的用户
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end