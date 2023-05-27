class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

 
  def index
    @restaurants = Restaurant.order(name: :asc).load_async
    @reservations = Reservation.all.order(created_at: :desc).load_async

    if params[:restaurant_id]
      @reservations = @reservations.where(restaurant_id: params[:restaurant_id])
    end
    @pagy, @reservations = pagy_countless(@reservations, items: 3)
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
    @restaurant_date = @reservation.startreservation.to_date
    

    @restaurant_reservation = Reservation.where(restaurant_id: @reservation.restaurant_id).where(startreservation: (@restaurant_date..@restaurant_date+1) ).count

    
    if @restaurant_reservation == 15
      redirect_to restaurants_path , alert: "Reservation can't be created." 
    else
      if @reservation.save
        redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." 
      else
        render :new, status: :unprocessable_entity 
      end  
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
