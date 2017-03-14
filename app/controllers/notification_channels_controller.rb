class NotificationChannelsController < ApplicationController
  before_action :set_notification_channel, only: [:show, :edit, :update, :destroy]

  # GET /notification_channels
  def index
    @notification_channels = NotificationChannel.all
  end

  # GET /notification_channels/1
  def show
  end

  # GET /notification_channels/new
  def new
    @notification_channel = NotificationChannel.new
  end

  # GET /notification_channels/1/edit
  def edit
  end

  # POST /notification_channels
  def create
    @notification_channel = NotificationChannel.new(notification_channel_params)

    if @notification_channel.save
      redirect_to @notification_channel, notice: 'Notification channel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notification_channels/1
  def update
    if @notification_channel.update(notification_channel_params)
      redirect_to @notification_channel, notice: 'Notification channel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notification_channels/1
  def destroy
    @notification_channel.destroy
    redirect_to notification_channels_url, notice: 'Notification channel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_channel
      @notification_channel = NotificationChannel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_channel_params
      params.require(:notification_channel).permit(:name)
    end
end
