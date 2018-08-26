class CreateOrdenDeCompras < ActiveRecord::Migration[5.2]
  def change

    create_table :orden_de_compras do |t|
      t.integer :cantidad

      t.timestamps
    end

    add_reference :orden_de_compras, :material, index: true
  end
end
