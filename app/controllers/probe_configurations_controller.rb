class ProbeConfigurationsController < ApplicationController
  # GET /probe_configurations
  # GET /probe_configurations.json
  def index
    @probe_configurations = ProbeConfiguration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @probe_configurations }
    end
  end

  # GET /probe_configurations/1
  # GET /probe_configurations/1.json
  def show
    @probe_configuration = ProbeConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @probe_configuration }
    end
  end

  # GET /probe_configurations/new
  # GET /probe_configurations/new.json
  def new
    @probe_configuration = ProbeConfiguration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @probe_configuration }
    end
  end

  # GET /probe_configurations/1/edit
  def edit
    @probe_configuration = ProbeConfiguration.find(params[:id])
  end

  # POST /probe_configurations
  # POST /probe_configurations.json
  def create
    @probe_configuration = ProbeConfiguration.new(params[:probe_configuration])

    respond_to do |format|
      if @probe_configuration.save
        format.html { redirect_to @probe_configuration, notice: 'Probe configuration was successfully created.' }
        format.json { render json: @probe_configuration, status: :created, location: @probe_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @probe_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /probe_configurations/1
  # PUT /probe_configurations/1.json
  def update
    @probe_configuration = ProbeConfiguration.find(params[:id])

    respond_to do |format|
      if @probe_configuration.update_attributes(params[:probe_configuration])
        format.html { redirect_to @probe_configuration, notice: 'Probe configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @probe_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probe_configurations/1
  # DELETE /probe_configurations/1.json
  def destroy
    @probe_configuration = ProbeConfiguration.find(params[:id])
    @probe_configuration.destroy

    respond_to do |format|
      format.html { redirect_to probe_configurations_url }
      format.json { head :no_content }
    end
  end
end
