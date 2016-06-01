class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update category_params
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  protected

  def category_params
    res = params.require(:category).permit(:name, :tile_image)
    res.delete(:tile_image) if res[:tile_image] == ''
    res
  end
end
