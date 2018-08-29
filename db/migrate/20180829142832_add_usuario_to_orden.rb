class AddUsuarioToOrden < ActiveRecord::Migration[5.2]
  def change
    add_reference :orden_de_compras, :usuario, index: true
  end
end
