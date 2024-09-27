# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  def after_sign_in_path_for(resources)
    root_path
  end

  def after_sign_out_path_for(resources)
    new_user_session_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "guestuserでログインしました"
  end

  def reject_user
    @user = User.find_by(email: params[:user][:email])
    if  @user
      if @user.valid_password?(params[:user][:password]) && @user.is_active == false
        flash[:alert] = "退会しています。再度登録をしてご利用下さい。"
        redirect_to new_user_registration_path
      end
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end
