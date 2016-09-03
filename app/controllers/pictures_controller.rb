class PicturesController < ApplicationController
  def index
  @pictures = Picture.order(id: :desc)
  end

  def new
   @picture = Picture.new
  end

  def create
    @picture = Picture.new(pictures_params)
    if @picture.save
      redirect_to pictures_path, notice: "写真を作成しました！"
    else
      # 入力フォームを再描画します。
      render action: 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(pictures_params)
    if @picture.save
      redirect_to pictures_path, notice: "写真を更新しました！"
    else
      # 入力フォームを再描画します。
      render action: 'edit'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
      redirect_to pictures_path, notice: "写真を削除しました！"
  end
  private
    def pictures_params
      params.require(:picture).permit(:title, :image)
    end

end
