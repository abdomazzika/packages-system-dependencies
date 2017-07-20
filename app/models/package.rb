class Package < ApplicationRecord
  has_many :package_system_dependencies
  has_many :system_dependencies,
           source: :system_dependency, through: :package_system_dependencies
  has_many :operating_systems,
           source: :operating_system, through: :package_system_dependencies
  has_many :package_dependencies,
           class_name: 'Package', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Package'
  def number_of_package_dependencies
    package_dependencies.count
  end
end
