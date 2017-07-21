# frozen_string_literal: true

class CreatePackageDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :package_dependencies, force: true, id: false do |t|
      t.integer 'first_package_id', null: false
      t.integer 'second_package_id', null: false

      t.timestamps
    end
  end
end
