class CreateMaterialsSolicituds < ActiveRecord::Migration[5.2]
  def change

    create_table :materials_solicituds do |t|
      t.integer :material_id
      t.integer :solicitud_id
      t.index :material_id
      t.index :solicitud_id
      t.integer :cantidad
      t.timestamps
    end
  end
end
