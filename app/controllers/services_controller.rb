class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]
  def index
    @services = Service.all
    render json: @services, status: :ok
  end

  def show
    render json: @service, status: :accepted
  end

  def create
    @service = Service.create(service_params)
    if @service.valid?
      render json: @service, status: :created
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def edit
  end

  def update
    @service.update(service_params)
    if @service.save
      render json: @service, status: :accepted
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @service.destroy
    render json: @service, status: :destroyed
  end

  private

  def service_params
    params.permit(:stylist_id, :customer_id)
  end

  def find_service
    @service = Service.find(params[:id])
  end
end
