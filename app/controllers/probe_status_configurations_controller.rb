class ProbeStatusConfigurationsController < ApplicationController
  # GET /probe_status_configurations
  # GET /probe_status_configurations.json
  def index
    @probe_status_configurations = ProbeStatusConfiguration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @probe_status_configurations }
    end
  end

  # GET /probe_status_configurations/1
  # GET /probe_status_configurations/1.json
  def show
    @probe_status_configuration = ProbeStatusConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @probe_status_configuration }
    end
  end

  # GET /probe_status_configurations/new
  # GET /probe_status_configurations/new.json
  def new
    @probe_status_configuration = ProbeStatusConfiguration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @probe_status_configuration }
    end
  end

  # GET /probe_status_configurations/1/edit
  def edit
    @probe_status_configuration = ProbeStatusConfiguration.find(params[:id])
  end

  # POST /probe_status_configurations
  # POST /probe_status_configurations.json
  def create
    @probe_status_configuration = ProbeStatusConfiguration.new(params[:probe_status_configuration])

    respond_to do |format|
      if @probe_status_configuration.save
        format.html { redirect_to @probe_status_configuration, notice: 'Probe status configuration was successfully created.' }
        format.json { render json: @probe_status_configuration, status: :created, location: @probe_status_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @probe_status_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /probe_status_configurations/1
  # PUT /probe_status_configurations/1.json
  def update
    @probe_status_configuration = ProbeStatusConfiguration.find(params[:id])

    respond_to do |format|
      if @probe_status_configuration.update_attributes(params[:probe_status_configuration])
        format.html { redirect_to @probe_status_configuration, notice: 'Probe status configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @probe_status_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probe_status_configurations/1
  # DELETE /probe_status_configurations/1.json
  def destroy
    @probe_status_configuration = ProbeStatusConfiguration.find(params[:id])
    @probe_status_configuration.destroy

    respond_to do |format|
      format.html { redirect_to probe_status_configurations_url }
      format.json { head :no_content }
    end
  end
end
