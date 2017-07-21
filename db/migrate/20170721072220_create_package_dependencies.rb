# frozen_string_literal: true

class CreatePackageDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :package_dependencies, force: true, id: false do |t|
      t.integer 'package_a_id', null: false
      t.integer 'package_b_id', null: false

      t.timestamps
    end
  end
end
