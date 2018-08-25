class CreateOrdenDeCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :orden_de_compras do |t|
      t.integer :id_material
      t.integer :cantidad

      t.timestamps
    end
  end
end
