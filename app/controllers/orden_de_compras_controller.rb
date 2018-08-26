class OrdenDeComprasController < ApplicationController
  before_action :set_orden_de_compra, only: [:show, :edit, :update, :destroy]

  # GET /orden_de_compras
  # GET /orden_de_compras.json
  def index
    @orden_de_compras = OrdenDeCompra.all
  end

  # GET /orden_de_compras/1
  # GET /orden_de_compras/1.json
  def show
  end

  # GET /orden_de_compras/new
  def new
    @orden_de_compra = OrdenDeCompra.new
  end

  # GET /orden_de_compras/1/edit
  def edit
  end

  # POST /orden_de_compras
  # POST /orden_de_compras.json
  def create
    @orden_de_compra = OrdenDeCompra.new(orden_de_compra_params)

    respond_to do |format|
      if @orden_de_compra.save
        format.html { redirect_to @orden_de_compra, notice: 'Orden de compra creada exitosamente' }
        format.json { render :show, status: :created, location: @orden_de_compra }
      else
        format.html { render :new }
        format.json { render json: @orden_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_de_compras/1
  # PATCH/PUT /orden_de_compras/1.json
  def update
    respond_to do |format|
      if @orden_de_compra.update(orden_de_compra_params)
        format.html { redirect_to @orden_de_compra, notice: 'Orden de compra actualizada exitosamente' }
        format.json { render :show, status: :ok, location: @orden_de_compra }
      else
        format.html { render :edit }
        format.json { render json: @orden_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_de_compras/1
  # DELETE /orden_de_compras/1.json
  def destroy
    @orden_de_compra.destroy
    respond_to do |format|
      format.html { redirect_to orden_de_compras_url, notice: 'Orden de compra eliminada exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_de_compra
      @orden_de_compra = OrdenDeCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_de_compra_params
      params.require(:orden_de_compra).permit(:material_id, :cantidad)
    end
end
