class UsersController < ApplicationController

 before_action :set_q, only: [:index, :search]

  def index
    @users = @q.result.page(params[:page]).reverse_order
  end

  def show
   @user=User.find(params[:id])
   @users = User.all
   @blogs=@user.blogs.all
  end

  def edit
   @user=User.find(params[:id])
  end

  def update
   @user=User.find(params[:id])
   @user.update(params_user)
   redirect_to user_path(@user)
  end

  def destroy
   @user=User.find(params[:id])
   #後程対応予定
  end

  def search
    @results = @q.result.page(params[:page]).reverse_order
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_valid: false)#is_validカラムにフラグを立てる(defaultはtrue)
    reset_session#ログアウトさせる
    flash[:notice] = "退会完了致しました。"
    redirect_to root_path
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end

  def params_user
  params.require(:user).permit(:profile_image,:name,:introduction)
  end

end
