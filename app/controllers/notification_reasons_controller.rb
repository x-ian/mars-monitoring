class NotificationReasonsController < ApplicationController
  before_action :set_notification_reason, only: [:show, :edit, :update, :destroy]

  # GET /notification_reasons
  def index
    @notification_reasons = NotificationReason.all
  end

  # GET /notification_reasons/1
  def show
  end

  # GET /notification_reasons/new
  def new
    @notification_reason = NotificationReason.new
  end

  # GET /notification_reasons/1/edit
  def edit
  end

  # POST /notification_reasons
  def create
    @notification_reason = NotificationReason.new(notification_reason_params)

    if @notification_reason.save
      redirect_to @notification_reason, notice: 'Notification reason was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notification_reasons/1
  def update
    if @notification_reason.update(notification_reason_params)
      redirect_to @notification_reason, notice: 'Notification reason was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notification_reasons/1
  def destroy
    @notification_reason.destroy
    redirect_to notification_reasons_url, notice: 'Notification reason was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_reason
      @notification_reason = NotificationReason.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_reason_params
      params.require(:notification_reason).permit(:name)
    end
end
