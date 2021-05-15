class Users::SessionsController < Devise::SessionsController

  before_action :reject_user, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to blogs_path #, notice: 'ゲストユーザーとしてログインしました。'
  end


  protected

  def reject_user
    @user = User.find_by(name: params[:user][:name].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to root_path
      end
    end
  end

end