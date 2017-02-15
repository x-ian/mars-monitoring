class ProbeTypesController < ApplicationController
  before_action :set_probe_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /probe_types
  def index
    @probe_types = ProbeType.all
  end

  # GET /probe_types/1
  def show
  end

  # GET /probe_types/new
  def new
    @probe_type = ProbeType.new
  end

  # GET /probe_types/1/edit
  def edit
  end

  # POST /probe_types
  def create
    @probe_type = ProbeType.new(probe_type_params)

    if @probe_type.save
      redirect_to @probe_type, notice: 'Probe type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /probe_types/1
  def update
    if @probe_type.update(probe_type_params)
      redirect_to @probe_type, notice: 'Probe type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /probe_types/1
  def destroy
    @probe_type.destroy
    redirect_to probe_types_url, notice: 'Probe type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probe_type
      @probe_type = ProbeType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def probe_type_params
      params.require(:probe_type).permit(:name, :description, :communication_channel_id, :value1_type_id, :value2_type_id, :value3_type_id, :value4_type_id, :value5_type_id, :value6_type_id, :value7_type_id, :value8_type_id, :value9_type_id, :value10_type_id, :value11_type_id, :value12_type_id, :value13_type_id, :value14_type_id, :value15_type_id, :value16_type_id)
    end
end
