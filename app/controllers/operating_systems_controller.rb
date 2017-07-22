# frozen_string_literal: true

class OperatingSystemsController < ApplicationController
  before_action :set_operating_system, only: %i(show update destroy)

  # GET /operating_systems
  def index
    @operating_systems = OperatingSystem.all

    render json: @operating_systems
  end

  # GET /operating_systems/1
  def show
    render json: @operating_system
  end

  # POST /operating_systems
  def create
    @operating_system = OperatingSystem.new(operating_system_params)

    if @operating_system.save
      render json: @operating_system, status: :created, location: @operating_system
    else
      render json: @operating_system.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /operating_systems/1
  def update
    if @operating_system.update(operating_system_params)
      render json: @operating_system
    else
      render json: @operating_system.errors, status: :unprocessable_entity
    end
  end

  # DELETE /operating_systems/1
  def destroy
    @operating_system.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_operating_system
    @operating_system = OperatingSystem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def operating_system_params
    params.require(:operating_system).permit(:name, :vendor, :bits, :package_manager)
  end
end
