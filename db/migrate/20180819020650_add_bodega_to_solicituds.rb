class AddBodegaToSolicituds < ActiveRecord::Migration[5.2]
  def change
    add_reference :solicituds, :bodega, index: true
  end
end
