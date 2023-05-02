class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

 
  def index

    @restaurants = Restaurant.all.with_attached_photo.order(created_at: :desc)
    
  end

  
  def show

  end

  def new
    @restaurant = Restaurant.new
  end


  def edit
  end

 
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end


    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :city, :photo)
    end
end
