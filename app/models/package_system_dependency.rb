# frozen_string_literal: true

class PackageSystemDependency < ApplicationRecord
  belongs_to :package
  belongs_to :operating_system
  belongs_to :system_dependency

  validates :package_id, presence: true
  validates :operating_system_id, presence: true
  validates :system_dependency_id, presence: true

  def number_of_system_dependencies
    PackageSystemDependency.where(package: package,
                                  operating_system: operating_system,).count
  end
end
