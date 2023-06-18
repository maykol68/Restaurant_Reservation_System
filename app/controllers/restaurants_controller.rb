class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

 
  def index

    @restaurants = Restaurant.all.with_attached_photo.order(created_at: :desc)
    
    if params[:query_text].present?
      @restaurants = @restaurants.search_full_text(params[:query_text])
    end

    @pagy, @restaurants = pagy_countless(@restaurants, items: 3)
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

    
    
      if @restaurant.save
         redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." 
        
      else
         render :new, status: :unprocessable_entity 
      end
  end

  def update
    
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." 
      else
         render :edit, status: :unprocessable_entity 
      end
  end


  def destroy
    @restaurant.destroy

      redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." 
  end

  private
    
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end


    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :city, :photo)
    end
end
