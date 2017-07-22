# frozen_string_literal: true

class CreateOperatingSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :operating_systems do |t|
      t.string :name
      t.string :vendor
      t.string :bits
      t.string :package_manager

      t.timestamps
    end
  end
end
