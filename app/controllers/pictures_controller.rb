class PicturesController < ApplicationController
  # before_action :authenticate_user!

before_action :set_picture, only: [:edit, :update, :destroy]
before_action :authenticate_user!

def index
  @pictures = Picture.order(id: :desc)
  end

def new
   @picture = Picture.new
end

def create
  @picture = Picture.new(pictures_params)
# binding.pry
  if @picture.save
    redirect_to pictures_path, notice: "写真を作成しました！"
  else
    # 入力フォームを再描画します。
    render action: 'new'
  end
end

def edit
end

def update
  @picture.update(pictures_params)
  if @picture.save
    redirect_to pictures_path, notice: "写真を更新しました！"
  else
    # 入力フォームを再描画します。
    render action: 'edit'
  end
end

def destroy
  @picture.destroy
  redirect_to pictures_path, notice: "写真を削除しました！"
end

  private
    def pictures_params
     params.require(:picture).permit(:title, :image)
    end

    # idをキーとして値を取得するメソッド
    def set_picture
      @picture = Picture.find(params[:id])
    end
end
