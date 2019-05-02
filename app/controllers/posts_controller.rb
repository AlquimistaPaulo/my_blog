class PostsController < ApplicationController
  def index
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
  end

  def update
  end

  def destroy
  end

  # プライベートメソッドでストロングパラメータを作成
  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
