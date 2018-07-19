class CreateSolicituds < ActiveRecord::Migration[5.2]
  def change
    create_table :solicituds do |t|
      t.belongs_to :usuario, index: true
      t.timestamps
    end
  end
end
