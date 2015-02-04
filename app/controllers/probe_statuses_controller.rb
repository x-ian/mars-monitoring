class ProbeStatusesController < ApplicationController
  before_filter :authenticate_user!

  # GET /probe_statuses
  # GET /probe_statuses.json
  def index
    @probe_statuses = ProbeStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @probe_statuses }
    end
  end

  # GET /probe_statuses/1
  # GET /probe_statuses/1.json
  def show
    @probe_status = ProbeStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @probe_status }
    end
  end

  # GET /probe_statuses/new
  # GET /probe_statuses/new.json
  def new
    @probe_status = ProbeStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @probe_status }
    end
  end

  # GET /probe_statuses/1/edit
  def edit
    @probe_status = ProbeStatus.find(params[:id])
  end

  # POST /probe_statuses
  # POST /probe_statuses.json
  def create
    @probe_status = ProbeStatus.new(params[:probe_status])

    respond_to do |format|
      if @probe_status.save
        format.html { redirect_to @probe_status, notice: 'Probe status was successfully created.' }
        format.json { render json: @probe_status, status: :created, location: @probe_status }
      else
        format.html { render action: "new" }
        format.json { render json: @probe_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /probe_statuses/1
  # PUT /probe_statuses/1.json
  def update
    @probe_status = ProbeStatus.find(params[:id])

    respond_to do |format|
      if @probe_status.update_attributes(params[:probe_status])
        format.html { redirect_to @probe_status, notice: 'Probe status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @probe_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probe_statuses/1
  # DELETE /probe_statuses/1.json
  def destroy
    @probe_status = ProbeStatus.find(params[:id])
    @probe_status.destroy

    respond_to do |format|
      format.html { redirect_to probe_statuses_url }
      format.json { head :no_content }
    end
  end
end
