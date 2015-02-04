class CommunicationChannelsController < ApplicationController
  before_filter :authenticate_user!

  # GET /communication_channels
  # GET /communication_channels.json
  def index
    @communication_channels = CommunicationChannel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @communication_channels }
    end
  end

  # GET /communication_channels/1
  # GET /communication_channels/1.json
  def show
    @communication_channel = CommunicationChannel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @communication_channel }
    end
  end

  # GET /communication_channels/new
  # GET /communication_channels/new.json
  def new
    @communication_channel = CommunicationChannel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @communication_channel }
    end
  end

  # GET /communication_channels/1/edit
  def edit
    @communication_channel = CommunicationChannel.find(params[:id])
  end

  # POST /communication_channels
  # POST /communication_channels.json
  def create
    @communication_channel = CommunicationChannel.new(params[:communication_channel])

    respond_to do |format|
      if @communication_channel.save
        format.html { redirect_to @communication_channel, notice: 'Communication channel was successfully created.' }
        format.json { render json: @communication_channel, status: :created, location: @communication_channel }
      else
        format.html { render action: "new" }
        format.json { render json: @communication_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /communication_channels/1
  # PUT /communication_channels/1.json
  def update
    @communication_channel = CommunicationChannel.find(params[:id])

    respond_to do |format|
      if @communication_channel.update_attributes(params[:communication_channel])
        format.html { redirect_to @communication_channel, notice: 'Communication channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @communication_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communication_channels/1
  # DELETE /communication_channels/1.json
  def destroy
    @communication_channel = CommunicationChannel.find(params[:id])
    @communication_channel.destroy

    respond_to do |format|
      format.html { redirect_to communication_channels_url }
      format.json { head :no_content }
    end
  end
end
