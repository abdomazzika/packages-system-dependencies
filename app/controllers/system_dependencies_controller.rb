# frozen_string_literal: true

class SystemDependenciesController < ApplicationController
  before_action :set_system_dependency, only: %i(show update destroy)

  # GET /system_dependencies
  def index
    @system_dependencies = SystemDependency.all

    render json: @system_dependencies
  end

  # GET /system_dependencies/1
  def show
    render json: @system_dependency
  end

  # POST /system_dependencies
  def create
    @system_dependency = SystemDependency.new(system_dependency_params)

    if @system_dependency.save
      render json: @system_dependency, status: :created, location: @system_dependency
    else
      render json: @system_dependency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /system_dependencies/1
  def update
    if @system_dependency.update(system_dependency_params)
      render json: @system_dependency
    else
      render json: @system_dependency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /system_dependencies/1
  def destroy
    @system_dependency.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_system_dependency
    @system_dependency = SystemDependency.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def system_dependency_params
    params.require(:system_dependency).permit(:name, :version)
  end
end
