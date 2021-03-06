# frozen_string_literal: true

class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :version

      t.timestamps
    end
  end
end
