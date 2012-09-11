class UserServiceClassificationsController < ApplicationController
  # GET /user_service_classifications
  # GET /user_service_classifications.json
  def index
    @user_service_classifications = UserServiceClassification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_service_classifications }
    end
  end

  # GET /user_service_classifications/1
  # GET /user_service_classifications/1.json
  def show
    @user_service_classification = UserServiceClassification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_service_classification }
    end
  end

  # GET /user_service_classifications/new
  # GET /user_service_classifications/new.json
  def new
    @user_service_classification = UserServiceClassification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_service_classification }
    end
  end

  # GET /user_service_classifications/1/edit
  def edit
    @user_service_classification = UserServiceClassification.find(params[:id])
  end

  # POST /user_service_classifications
  # POST /user_service_classifications.json
  def create
    @user_service_classification = UserServiceClassification.new(params[:user_service_classification])

    respond_to do |format|
      if @user_service_classification.save
        format.html { redirect_to @user_service_classification, notice: 'User service classification was successfully created.' }
        format.json { render json: @user_service_classification, status: :created, location: @user_service_classification }
      else
        format.html { render action: "new" }
        format.json { render json: @user_service_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_service_classifications/1
  # PUT /user_service_classifications/1.json
  def update
    @user_service_classification = UserServiceClassification.find(params[:id])

    respond_to do |format|
      if @user_service_classification.update_attributes(params[:user_service_classification])
        format.html { redirect_to @user_service_classification, notice: 'User service classification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_service_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_service_classifications/1
  # DELETE /user_service_classifications/1.json
  def destroy
    @user_service_classification = UserServiceClassification.find(params[:id])
    @user_service_classification.destroy

    respond_to do |format|
      format.html { redirect_to user_service_classifications_url }
      format.json { head :no_content }
    end
  end
end
