class ProbesController < ApplicationController
  before_action :set_probe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /probes
  def index
    @probes = Probe.all
  end

  # GET /probes/1
  def show
  end

  # GET /probes/new
  def new
    @probe = Probe.new
  end

  # GET /probes/1/edit
  def edit
  end

  # POST /probes
  def create
    @probe = Probe.new(probe_params)

    if @probe.save
      redirect_to @probe, notice: 'Probe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /probes/1
  def update
    if @probe.update(probe_params)
      redirect_to @probe, notice: 'Probe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /probes/1
  def destroy
    @probe.destroy
    redirect_to probes_url, notice: 'Probe was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probe
      @probe = Probe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def probe_params
      params.require(:probe).permit(:id, :name, :customer_id, :location_id, :probe_type_id, :probe_configuration_id, :forward_subscription_id, :location_coordinates, :responsible_user_id, :enabled, :cell_number)
    end
end
