class MenusController < ApplicationController
  before_action :find_menu, only: [:show, :update]
  def index
    @menus = Menu.all
    render json: @menus, status: :ok
  end

  def show
    render json: @menu, status: :accepted
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.valid?
      render json: @menu, status: :created
    else
      render json: { errors: @menu.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def update
    @menu.update(menu_params)
    if @menu.save
      render json: @menu, status: :accepted
    else
      render json: { errors: @menu.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def menu_params
    params.permit(:menu_id, :sytlist_id, :customer_id)
  end

  def find_menu
    @menu = Menu.find(params[:id])
  end
end
