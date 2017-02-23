class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @current_user = current_user
  end

  def show 
    @attraction = Attraction.find_by_id(params[:id])
    @current_user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end


  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
