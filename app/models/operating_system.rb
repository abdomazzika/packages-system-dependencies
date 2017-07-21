# frozen_string_literal: true

class OperatingSystem < ApplicationRecord
  has_many :package_system_dependencies
  has_many :packages,
           source: :package, through: :package_system_dependencies
  has_many :system_dependencies,
           source: :system_dependency, through: :package_system_dependencies
end
