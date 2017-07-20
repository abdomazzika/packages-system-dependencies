class CreatePackageSystemDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :package_system_dependencies do |t|

      t.references :package, index: true
      t.references :os, index: true
      t.references :system_dependency, index: true

      t.index %i[package_id os_id]

      t.timestamps
    end
  end
end
