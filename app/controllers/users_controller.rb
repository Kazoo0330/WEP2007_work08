class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end
  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to blogs_path, notice: "アカウント作成しました"
    else
      render :new if @user.invalid?
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "アカウントを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to blogs_path, notice:"投稿を削除しました！"
  end

  def confirm
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
