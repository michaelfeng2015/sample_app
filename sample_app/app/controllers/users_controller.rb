class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "恭喜您！成功加入搞基大家庭！"
      redirect_to @user
    else
      render 'new'
      # flash[:danger] = "恭喜您！成功加入搞基大家庭！"
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
