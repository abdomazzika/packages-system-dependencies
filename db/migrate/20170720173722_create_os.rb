class CreateOs < ActiveRecord::Migration[5.1]
  def change
    create_table :os do |t|
      t.string :name
      t.string :edition
      t.string :package_manager

      t.timestamps
    end
  end
end
