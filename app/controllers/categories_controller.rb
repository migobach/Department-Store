class CategoriesController < ApplicationController
  before_action :set_cat, only: [:show, :update, :edit, :destroy] 


  def index
    @categories = Category.all
  end

  def show
  end
  
  def new
    @category = Category.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def update 
    if @category.update(category_params)
      redirect_to @category
    else 
      render :edit
    end
  end

  def destroy 
    @category.destroy
    redirect_to categories_path
  end


    private

    def set_cat
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
