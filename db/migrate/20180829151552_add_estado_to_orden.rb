class AddEstadoToOrden < ActiveRecord::Migration[5.2]
  def change
    add_column :orden_de_compras, :estado, :string
  end
end
