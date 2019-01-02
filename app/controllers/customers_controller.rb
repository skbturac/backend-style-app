class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :update]
  def index
    @customers = Customer.all
    render json: @customers, status: :ok
  end

  def show
    render json: @customer, status: :accepted
  end

  def create
    @customer = Customer.create(customer_params)
    if @customer.valid?
      render json: @customer, status: :created
    else
      render json: { errors: @customer.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def update
    @customer.update(customer_params)
    if @customer.save
      render json: @customer, status: :accepted
    else
      render json: { errors: @customer.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def customer_params
    params.permit(:firstName, :lastName, :locations_id)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
