class ProveedorMailer < ApplicationMailer
  default from: 'iswmailprueba@gmail.com'

  def cotizar_email
    @proveedor = params[:proveedor]
    @material = params[:material]
    mail(to: @proveedor.email, subject: 'Cotizar Material')
  end

end
