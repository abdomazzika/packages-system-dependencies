class PackageSystemDependenciesController < ApplicationController
  before_action :set_package_system_dependency, only: [:show, :update, :destroy]

  # GET /package_system_dependencies
  def index
    @package_system_dependencies = PackageSystemDependency.all

    render json: @package_system_dependencies
  end

  # GET /package_system_dependencies/1
  def show
    render json: @package_system_dependency
  end

  # POST /package_system_dependencies
  def create
    @package_system_dependency = PackageSystemDependency.new(package_system_dependency_params)

    if @package_system_dependency.save
      render json: @package_system_dependency, status: :created, location: @package_system_dependency
    else
      render json: @package_system_dependency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /package_system_dependencies/1
  def update
    if @package_system_dependency.update(package_system_dependency_params)
      render json: @package_system_dependency
    else
      render json: @package_system_dependency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /package_system_dependencies/1
  def destroy
    @package_system_dependency.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_system_dependency
      @package_system_dependency = PackageSystemDependency.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def package_system_dependency_params
      params.fetch(:package_system_dependency, {})
    end
end
