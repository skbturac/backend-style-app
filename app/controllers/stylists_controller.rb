class StylistsController < ApplicationController
  before_action :find_stylist, only: [:show, :update]
  def index
    @stylists = Stylist.all
    render json: @stylists, status: :ok
  end

  def show
    render json: @stylist, status: :accepted
  end

  def create
    @stylist = Stylist.create(stylist_params)
    if @stylist.valid?
      render json: @stylist, status: :created
    else
      render json: { errors: @stylist.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def update
    @stylist.update(stylist_params)
    if @stylist.save
      render json: @stylist, status: :accepted
    else
      render json: { errors: @stylist.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def stylist_params
    params.permit(:firstName, :lastName, :locations_id)
  end

  def find_stylist
    @stylist = Stylist.find(params[:id])
  end
end
