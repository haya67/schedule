class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new (params.permit(:title, :start, :finish, :all_day, :content))
    if @post.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to :posts
    else
      flash[:alert] = "予定の登録に失敗しました。"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start, :finish, :all_day, :content))
      flash[:notice] = "ユーザーIDが「#{@post.id}」の情報を更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to :posts
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
