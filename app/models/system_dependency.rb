# frozen_string_literal: true

class SystemDependency < ApplicationRecord
  has_many :package_system_dependencies
  has_many :packages,
           source: :package, through: :package_system_dependencies
  has_many :operating_systems,
           source: :operating_system, through: :package_system_dependencies
end
