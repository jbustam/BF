class AddColumnsToSolicitud < ActiveRecord::Migration[5.2]
  def change
    add_column :solicituds, :estado, :string
  end
end
