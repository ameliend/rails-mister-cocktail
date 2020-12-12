class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  #create
  def new
    @cocktail = Cocktail.new # needed to instantiate the form_for
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end

  #read
  def index
    if params[:query].present?
      @cocktails = Cocktail.where('name LIKE ?', "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @dose = Dose.new
  end

  #update
  def edit
  end

  def update
    @coctail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end


private
  def set_cocktail
      @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :cocktail_url, :query)
  end

end
