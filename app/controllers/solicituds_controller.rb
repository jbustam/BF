class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: [:show, :edit, :update, :destroy]


  # GET /solicituds
  # GET /solicituds.json
  def index
    @solicituds = Solicitud.all

  end

  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
    authorize! :read, @solicitud
  end

  # GET /solicituds/new
  def new
    @solicitud = Solicitud.new
    2.times { @solicitud.materials.build }
  end

  # GET /solicituds/1/edit
  def edit
  end

  # POST /solicituds
  # POST /solicituds.json
  def create
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.usuario_id = current_user.id

    respond_to do |format|
      if @solicitud.save

        solicitud_params[:materials_attributes].values.each do |material_attribute|
          material = Material.find_by(descripcion: material_attribute[:descripcion])
          mat_sol = MaterialsSolicitud.find_by(material_id: material.id,
            solicitud_id: @solicitud.id)
          MaterialsSolicitud.update(mat_sol.id, cantidad: material_attribute[:cantidad])
        end

        format.html { redirect_to @solicitud, notice: 'La solicitud fue creada correctamente' }
        format.json { render :show, status: :created, location: @solicitud }
      else
        format.html { render :new }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicituds/1
  # PATCH/PUT /solicituds/1.json
  def update
    authorize! :update, @solicitud
    respond_to do |format|
      if @solicitud.update(solicitud_params)
        format.html { redirect_to @solicitud, notice: 'La solicitud fue actualizada correctamente' }
        format.json { render :show, status: :ok, location: @solicitud }
      else
        format.html { render :edit }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicituds/1
  # DELETE /solicituds/1.json
  def destroy
    @solicitud.destroy
    authorize! :delete, @solicitud
    respond_to do |format|
      format.html { redirect_to solicituds_url, notice: 'La solicitud fue eliminada correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_params
      params.require(:solicitud).permit(:nombre, :usuario, :estado,
        :materials_attributes => [:id, :descripcion, :cantidad])
    end
end
