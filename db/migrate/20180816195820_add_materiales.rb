class AddMateriales < ActiveRecord::Migration[5.2]
  def change
    drop_table :materials
    drop_table :solicituds

    create_table :materials do |t|
      t.string :descripcion
      t.timestamps
    end

    create_table :solicituds do |t|
      t.belongs_to :usuario, index: true
      t.string :nombre
      t.string :estado
      t.timestamps
    end

  end
end
