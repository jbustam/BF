class BodegasController < ApplicationController
  before_action :set_bodega, only: [:show, :edit, :update, :destroy]

  # GET /bodegas
  # GET /bodegas.json
  def index
    @bodegas = Bodega.all
  end

  # GET /bodegas/1
  # GET /bodegas/1.json
  def show
  end

  def destroy_material
    @producto = BodegasMaterial.find(params[:producto])
    @producto.destroy
    authorize! :delete, @producto
    respond_to do |format|
      format.html { redirect_to bodega_url(params[:bodega]), notice: 'El materia fue eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  # GET /bodegas/new
  def new
    @bodega = Bodega.new
    2.times { @bodega.materials.build }
  end

  # GET /bodegas/1/edit
  def edit
  end

  # POST /bodegas
  # POST /bodegas.json
  def create
    @bodega = Bodega.new(bodega_params)

    respond_to do |format|
      if @bodega.save
        actualizar
        format.html { redirect_to @bodega, notice: 'Bodega fue creada exitosamente' }
        format.json { render :show, status: :created, location: @bodega }
      else
        format.html { render :new }
        format.json { render json: @bodega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bodegas/1
  # PATCH/PUT /bodegas/1.json
  def update
    respond_to do |format|
      if @bodega.update(bodega_params)
        actualizar
        format.html { redirect_to @bodega, notice: 'Bodega fue actualizada exitosamente' }
        format.json { render :show, status: :ok, location: @bodega }
      else
        format.html { render :edit }
        format.json { render json: @bodega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bodegas/1
  # DELETE /bodegas/1.json
  def destroy
    @bodega.destroy
    respond_to do |format|
      format.html { redirect_to bodegas_url, notice: 'Bodega fue eliminada exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bodega
      @bodega = Bodega.find(params[:id])
    end

    def actualizar
      if not bodega_params[:materials_attributes].nil?
        bodega_params[:materials_attributes].values.each do |material_attribute|
          material = Material.find_by(descripcion: material_attribute[:descripcion])
          mat_bod = BodegasMaterial.find_by(material_id: material.id,
            bodega_id: @bodega.id)
          BodegasMaterial.update(mat_bod.id, cantidad: material_attribute[:cantidad])
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bodega_params
      params.require(:bodega).permit(:nombre, :ubicacion,
        :materials_attributes => [:id, :descripcion, :cantidad])
    end
end
