class PostsController < ApplicationController
  def index
    @posts = Post.all
    @new_posts = Post.all
    @author = Author.first
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # Postモデルのインスタンスを生成
    @post = Post.new
  end

  def create
    # Postモデルのインスタンスを生成(ストロングパラメータでデータを取得)
    # saveする
    # showページにリダイレクト
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
  end

  # プライベートメソッドでストロングパラメータを作成
  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
