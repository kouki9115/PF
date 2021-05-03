class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
   @user=User.find(params[:id])
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

  private
  def params_user
  params.require(:user).permit(:profile_image,:name,:introduction)
  end
end
