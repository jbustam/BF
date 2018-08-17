class CreateBodegasMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :bodegas_materials do |t|
      t.integer :material_id
      t.integer :bodega_id
      t.index :material_id
      t.index :bodega_id
      t.integer :cantidad
      t.timestamps
    end
  end
end
