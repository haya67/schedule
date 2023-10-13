class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new (params.permit(:title, :start, :finish, :all_day, :content))
    if @user.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to :users
    else
      flash[:alert] = "予定の登録に失敗しました。"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start, :finish, :all_day, :content))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "削除しました"
    redirect_to :users
  end

def post_params
    t.string :title
    t.string :start
    t.string :finish
    t.string :all_day
    
    t.text :content
    t.datetime :start_time
end

end
