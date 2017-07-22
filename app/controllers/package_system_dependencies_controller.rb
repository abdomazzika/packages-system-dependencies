# frozen_string_literal: true

class PackageSystemDependenciesController < ApplicationController
  before_action :set_package_system_dependency, only: %i(show update destroy)
  before_action :prepare_search_params, only: %i(search)

  # GET /package_system_dependencies
  def index
    @package_system_dependencies = PackageSystemDependency.all

    render json: @package_system_dependencies
  end

  # GET /package_system_dependencies/1
  def show
    render json: @package_system_dependency
  end

  # GET /lookups/package_system_dependencies,  params: [packages]
  def search
    request_params = prepare_search_params

    operating_system = OperatingSystem.find_by(
      name: request_params[:operating_system][:name],
      vendor: request_params[:operating_system][:vendor],
      bits: request_params[:operating_system][:bits],
    )
    package_manager = operating_system.package_manager

    packages = []
    request_params[:packages].each do |package|
      package_name = package[:name]
      package_version = package[:version]

      packages << Package.find_by(name: package_name, version: package_version)
    end

    packages_dependencies = []
    packages.compact.each do |package|
      packages_dependencies <<
        { package_name: package[:name], package_dependencies: package.package_dependencies }
    end

    system_dependencies = []
    packages_dependencies.compact.each do |package|
      dependencies = []
      package[:package_dependencies].each do |p|
        dependencies = PackageSystemDependency.where(
          package: p, operating_system: operating_system,
        ).map(&:system_dependency)
      end
      system_dependencies << {
        package_name: package[:package_name],
        system_dependencies: dependencies,
      }
    end

    render json: { packages: system_dependencies, package_manager: package_manager }, status: 200
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
    data = params.require(:package_system_dependency).permit(
      package: %i(name version), operating_system: %i(name edition),
      system_dependency: %i(name version),
    )
    package = Package.find_by(name: data[:package][:name],
                              version: data[:package][:version],)
    operating_system = OperatingSystem.find_by(name: data[:operating_system][:name],
                                               vendor: data[:operating_system][:vendor],
                                               bits: data[:operating_system][:bits],)
    system_dependency = SystemDependency.find_by(name: data[:system_dependency][:name],
                                                 version: data[:system_dependency][:version],)

    {
      package: package,
      operating_system: operating_system,
      system_dependency: system_dependency,
    }
  end

  def prepare_search_params
    data = params.require(:lookup).permit(
      packages: %i(name version), operating_system: %i(name vendor bits),
    )

    {
      packages: data[:packages],
      operating_system: data[:operating_system],
    }
  end
end
