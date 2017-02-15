class ProbeConfigurationsController < ApplicationController
  before_action :set_probe_configuration, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /probe_configurations
  def index
    @probe_configurations = ProbeConfiguration.all
  end

  # GET /probe_configurations/1
  def show
  end

  # GET /probe_configurations/new
  def new
    @probe_configuration = ProbeConfiguration.new
  end

  # GET /probe_configurations/1/edit
  def edit
  end

  # POST /probe_configurations
  def create
    @probe_configuration = ProbeConfiguration.new(probe_configuration_params)

    if @probe_configuration.save
      redirect_to @probe_configuration, notice: 'Probe configuration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /probe_configurations/1
  def update
    if @probe_configuration.update(probe_configuration_params)
      redirect_to @probe_configuration, notice: 'Probe configuration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /probe_configurations/1
  def destroy
    @probe_configuration.destroy
    redirect_to probe_configurations_url, notice: 'Probe configuration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probe_configuration
      @probe_configuration = ProbeConfiguration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def probe_configuration_params
      params.require(:probe_configuration).permit(:name, :rule_ok, :rule_warning, :rule_error, :rule_assumed, :heartbeat_interval, :alarm_interval, :value1_threshold, :value2_threshold, :value3_threshold, :value4_threshold, :value5_threshold, :value6_threshold, :value7_threshold, :value8_threshold, :value9_threshold, :value10_threshold, :value11_threshold, :value12_threshold, :value13_threshold, :value14_threshold, :value15_threshold, :value16_threshold)
    end
end
