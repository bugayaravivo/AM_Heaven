class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :ensure_user, only: [:edit]


  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールが更新されました。"
      redirect_to user_path(current_user)
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    user_id = current_user.id
    user = User.find(user_id)
    user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :user_image, :is_active)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def ensure_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user), notice: "他のユーザーのプロフィール編集画面へは遷移できません。"
    end
  end
end
