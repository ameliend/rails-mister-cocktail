class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  def destroy
  end


private
  def review_params
    params.require(:review).permit(:rating, :description, :cocktail_id)
  end

end
