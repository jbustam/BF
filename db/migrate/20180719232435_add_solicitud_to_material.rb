class AddSolicitudToMaterial < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :solicitud, index: true
  end
end
