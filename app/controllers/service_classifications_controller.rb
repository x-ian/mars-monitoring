class ServiceClassificationsController < ApplicationController
  # GET /service_classifications
  # GET /service_classifications.json
  def index
    @service_classifications = ServiceClassification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_classifications }
    end
  end

  # GET /service_classifications/1
  # GET /service_classifications/1.json
  def show
    @service_classification = ServiceClassification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service_classification }
    end
  end

  # GET /service_classifications/new
  # GET /service_classifications/new.json
  def new
    @service_classification = ServiceClassification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service_classification }
    end
  end

  # GET /service_classifications/1/edit
  def edit
    @service_classification = ServiceClassification.find(params[:id])
  end

  # POST /service_classifications
  # POST /service_classifications.json
  def create
    @service_classification = ServiceClassification.new(params[:service_classification])

    respond_to do |format|
      if @service_classification.save
        format.html { redirect_to @service_classification, notice: 'Service classification was successfully created.' }
        format.json { render json: @service_classification, status: :created, location: @service_classification }
      else
        format.html { render action: "new" }
        format.json { render json: @service_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /service_classifications/1
  # PUT /service_classifications/1.json
  def update
    @service_classification = ServiceClassification.find(params[:id])

    respond_to do |format|
      if @service_classification.update_attributes(params[:service_classification])
        format.html { redirect_to @service_classification, notice: 'Service classification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_classifications/1
  # DELETE /service_classifications/1.json
  def destroy
    @service_classification = ServiceClassification.find(params[:id])
    @service_classification.destroy

    respond_to do |format|
      format.html { redirect_to service_classifications_url }
      format.json { head :no_content }
    end
  end
end
