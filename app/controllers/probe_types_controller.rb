class ProbeTypesController < ApplicationController
  # GET /probe_types
  # GET /probe_types.json
  def index
    @probe_types = ProbeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @probe_types }
    end
  end

  # GET /probe_types/1
  # GET /probe_types/1.json
  def show
    @probe_type = ProbeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @probe_type }
    end
  end

  # GET /probe_types/new
  # GET /probe_types/new.json
  def new
    @probe_type = ProbeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @probe_type }
    end
  end

  # GET /probe_types/1/edit
  def edit
    @probe_type = ProbeType.find(params[:id])
  end

  # POST /probe_types
  # POST /probe_types.json
  def create
    @probe_type = ProbeType.new(params[:probe_type])

    respond_to do |format|
      if @probe_type.save
        format.html { redirect_to @probe_type, notice: 'Probe type was successfully created.' }
        format.json { render json: @probe_type, status: :created, location: @probe_type }
      else
        format.html { render action: "new" }
        format.json { render json: @probe_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /probe_types/1
  # PUT /probe_types/1.json
  def update
    @probe_type = ProbeType.find(params[:id])

    respond_to do |format|
      if @probe_type.update_attributes(params[:probe_type])
        format.html { redirect_to @probe_type, notice: 'Probe type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @probe_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probe_types/1
  # DELETE /probe_types/1.json
  def destroy
    @probe_type = ProbeType.find(params[:id])
    @probe_type.destroy

    respond_to do |format|
      format.html { redirect_to probe_types_url }
      format.json { head :no_content }
    end
  end
end
