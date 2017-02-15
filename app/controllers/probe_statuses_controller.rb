class ProbeStatusesController < ApplicationController
  before_action :set_probe_status, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /probe_statuses
  def index
    @probe_statuses = ProbeStatus.all
  end

  # GET /probe_statuses/1
  def show
  end

  # GET /probe_statuses/new
  def new
    @probe_status = ProbeStatus.new
  end

  # GET /probe_statuses/1/edit
  def edit
  end

  # POST /probe_statuses
  def create
    @probe_status = ProbeStatus.new(probe_status_params)

    if @probe_status.save
      redirect_to @probe_status, notice: 'Probe status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /probe_statuses/1
  def update
    if @probe_status.update(probe_status_params)
      redirect_to @probe_status, notice: 'Probe status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /probe_statuses/1
  def destroy
    @probe_status.destroy
    redirect_to probe_statuses_url, notice: 'Probe status was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probe_status
      @probe_status = ProbeStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def probe_status_params
      params.require(:probe_status).permit(:name, :status, :assumed, :severity_order)
    end
end
