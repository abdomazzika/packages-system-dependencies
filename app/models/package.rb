# frozen_string_literal: true

class Package < ApplicationRecord
  has_many :package_system_dependencies
  has_many :system_dependencies,
           source: :system_dependency, through: :package_system_dependencies
  has_many :operating_systems,
           source: :operating_system, through: :package_system_dependencies
  has_and_belongs_to_many(:packages,
                          join_table: 'package_dependencies',
                          foreign_key: 'first_package_id',
                          association_foreign_key: 'second_package_id',)

  def package_dependencies
    dependencies = packages

    loop do
      dependencies = dependencies.uniq
      flag = false

      dependencies.each do |package|
        current_package_dependencies = []
        package.packages.each { |p| current_package_dependencies << p }
        unless (current_package_dependencies - dependencies).empty?
          package.packages.each { |p| dependencies << p }
          flag = true
        end
      end

      break unless flag
    end

    dependencies << self
  end

  def number_of_package_dependencies
    package_dependencies.count
  end
end
