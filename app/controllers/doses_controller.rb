class DosesController < ApplicationController

   before_action :set_dose, only: [:show, :edit, :update, :destroy]
  #create
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new # needed to instantiate the form_for
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'dose was successfully created.'
    else
      render 'cocktails/show'
    end
  end


  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end


private
  def set_dose
      @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
