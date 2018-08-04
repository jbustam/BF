class AddNombreToSolicitud < ActiveRecord::Migration[5.2]
  def change
    add_column :solicituds, :nombre, :string
  end
end
