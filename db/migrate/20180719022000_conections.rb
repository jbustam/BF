class Conections < ActiveRecord::Migration[5.2]
  def change

    create_table :materials do |t|
      t.string :descripcion
      t.integer :cantidad
      t.timestamps
    end
  end
end
