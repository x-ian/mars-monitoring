class CommunicationChannelsController < ApplicationController
  before_action :set_communication_channel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /communication_channels
  def index
    @communication_channels = CommunicationChannel.all
  end

  # GET /communication_channels/1
  def show
  end

  # GET /communication_channels/new
  def new
    @communication_channel = CommunicationChannel.new
  end

  # GET /communication_channels/1/edit
  def edit
  end

  # POST /communication_channels
  def create
    @communication_channel = CommunicationChannel.new(communication_channel_params)

    if @communication_channel.save
      redirect_to @communication_channel, notice: 'Communication channel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /communication_channels/1
  def update
    if @communication_channel.update(communication_channel_params)
      redirect_to @communication_channel, notice: 'Communication channel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /communication_channels/1
  def destroy
    @communication_channel.destroy
    redirect_to communication_channels_url, notice: 'Communication channel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communication_channel
      @communication_channel = CommunicationChannel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def communication_channel_params
      params.require(:communication_channel).permit(:name)
    end
end
