class ProbesProbeStatusConfigrationsController < ApplicationController
  # GET /probes_probe_status_configrations
  # GET /probes_probe_status_configrations.json
  def index
    @probes_probe_status_configrations = ProbesProbeStatusConfigration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @probes_probe_status_configrations }
    end
  end

  # GET /probes_probe_status_configrations/1
  # GET /probes_probe_status_configrations/1.json
  def show
    @probes_probe_status_configration = ProbesProbeStatusConfigration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @probes_probe_status_configration }
    end
  end

  # GET /probes_probe_status_configrations/new
  # GET /probes_probe_status_configrations/new.json
  def new
    @probes_probe_status_configration = ProbesProbeStatusConfigration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @probes_probe_status_configration }
    end
  end

  # GET /probes_probe_status_configrations/1/edit
  def edit
    @probes_probe_status_configration = ProbesProbeStatusConfigration.find(params[:id])
  end

  # POST /probes_probe_status_configrations
  # POST /probes_probe_status_configrations.json
  def create
    @probes_probe_status_configration = ProbesProbeStatusConfigration.new(params[:probes_probe_status_configration])

    respond_to do |format|
      if @probes_probe_status_configration.save
        format.html { redirect_to @probes_probe_status_configration, notice: 'Probes probe status configration was successfully created.' }
        format.json { render json: @probes_probe_status_configration, status: :created, location: @probes_probe_status_configration }
      else
        format.html { render action: "new" }
        format.json { render json: @probes_probe_status_configration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /probes_probe_status_configrations/1
  # PUT /probes_probe_status_configrations/1.json
  def update
    @probes_probe_status_configration = ProbesProbeStatusConfigration.find(params[:id])

    respond_to do |format|
      if @probes_probe_status_configration.update_attributes(params[:probes_probe_status_configration])
        format.html { redirect_to @probes_probe_status_configration, notice: 'Probes probe status configration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @probes_probe_status_configration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probes_probe_status_configrations/1
  # DELETE /probes_probe_status_configrations/1.json
  def destroy
    @probes_probe_status_configration = ProbesProbeStatusConfigration.find(params[:id])
    @probes_probe_status_configration.destroy

    respond_to do |format|
      format.html { redirect_to probes_probe_status_configrations_url }
      format.json { head :no_content }
    end
  end
end
