class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      #セッションにuse.id入れる
      redirect_to mypage_path
    else
      # flash[:user] = user
      # flash[:error_messages] = user.errors.full_messages
      # redirect_back root_path
      redirect_back fallback_location: root_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
    #自分のプロフィールページ
  @user = @current_user
  end

  def show
  @user = User.find(params[:id])
  #userを特定
  if @user == @current_user
    redirect_to mypage_path
    #もしusers詳細ページがcurrent_userならmeページにリダイレクトする
  else
  end
  end

  def edit
  @user = @current_user
  end

  def update
    user = @current_user
    #現在userを入れる
    if user.update(user_params)
      session[:user_id] = user.id
      #sessionにuseridを入れる
      redirect_to mypage_path
    else
      flash[:error_messages] = user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :faculty, :profile, :image)
  end
end