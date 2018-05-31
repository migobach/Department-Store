class RatingsController < ApplicationController
  before_action :set_item

  def new
    @rating = @item.ratings.new
  end

  def create
    @rating = @item.ratings.new(rating_params)
    if @rating.save
      redirect_to category_item_path(@item.category_id, @item)
    else 
      render :new
    end
  end

    private
    def set_item
      @item = Item.find(params[:item_id])
    end

    def rating_params
      params.require(:rating).permit(:body, :author)
    end
end
