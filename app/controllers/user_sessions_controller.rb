class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new;end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to merchandises_path
    else
      flash.now[:alert] = 'もう一度入力してください'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
