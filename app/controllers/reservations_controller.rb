class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

 
  def index
    @restaurants = Restaurant.order(name: :asc).load_async
    @reservations = Reservation.all.order(created_at: :desc).load_async

    if params[:restaurant_id]
      @reservations = @reservations.where(restaurant_id: params[:restaurant_id])
    end
  end

  def show
  end


  def new
    @reservation = Reservation.new
  end

  
  def edit
  end


  def create
    @reservation = Reservation.new(reservation_params)

    
      if @reservation.save
        redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." 
        
      else
        render :new, status: :unprocessable_entity 
        
      end
  end


  def update
    
      if @reservation.update(reservation_params)
        redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." 
        
      else
        render :edit, status: :unprocessable_entity 
        
      end
  end


  def destroy
    @reservation.destroy

    redirect_to reservations_url, notice: "Reservation was successfully destroyed." 
  
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

   
    def reservation_params
      params.require(:reservation).permit(:mesa, :startreservation, :endreservation, :restaurant_id)
    end
end
