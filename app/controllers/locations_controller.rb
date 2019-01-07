class LocationsController < ApplicationController
 def index
  @locations = Location.all
  render json: @locations, status: :ok
 end

 def show
   @location = Location.find(params[:id])
   render json: @location, status: :accepted
 end

 def new
   @location = Location.new
 end

 def create
   @location = Location.new(location_params)
   if @location.valid?
     render json: @location, status: :created
   else
     # render :new
     render json: { errors: @location.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def edit
   @location = Location.find(params[:id])
 end

 def update
   @location = Location.find(params[:id])
   if @location.save
     render json: @customer, status: :accepted, :notice  => "Successfully updated location."
   else
     render json: { errors: @location.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @location = Location.find(params[:id])
   @location.destroy
   render json: @location, status: :destroyed
 end

 private

 def location_params
   params.permit(:address, :latitude, :longitude, :stylist_id, :customer_id)
 end
end
