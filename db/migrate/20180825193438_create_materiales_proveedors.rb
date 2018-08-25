class CreateMaterialesProveedors < ActiveRecord::Migration[5.2]
  def change
    create_table :materials_proveedors do |t|

      t.timestamps
    end

    add_reference :materials_proveedors, :material, index: true
    add_reference :materials_proveedors, :proveedor, index: true
  end
end
