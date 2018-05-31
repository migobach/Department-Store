class ItemsController < ApplicationController
  before_action :set_category
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = @category.items
  end

  def show
    @rating = Rating.all
  end

  def new
    @item = @category.items.new
    render :form
  end

  def edit
    render :form
  end

  def create 
    @item = @category.items.new(item_params)

    if @item.save
      redirect_to [@category, @item]
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@category, @item]
    else
      render :edit
    end
  end

  def destroy
    @item.destroy 
    redirect_to category_items_path
  end 


    private

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :price, :available)
    end
end
