# frozen_string_literal: true

class PackageDependenciesController < ApplicationController
  # GET /package_dependencies
  def index
    @package_dependencies = PackageDependency.all

    render json: @package_dependencies
  end

  # POST /package_dependencies
  def create
    @package_dependency = PackageDependency.new(package_dependency_params)

    if @package_dependency.save
      render json: { status: 'created successfully' }, status: :created
    else
      render json: @package_dependency.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def package_dependency_params
    data = params.require(:package_dependency).permit(first_package: %i(name version), second_package: %i(name version))
    first_package = Package.find_by(name: data[:first_package][:name],
                                    version: data[:first_package][:version],)
    second_package = Package.find_by(name: data[:second_package][:name],
                                     version: data[:second_package][:version],)

    {
      first_package_id: first_package.id,
      second_package_id: second_package.id,
    }
  end
end
