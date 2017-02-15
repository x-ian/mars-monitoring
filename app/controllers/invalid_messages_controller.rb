class InvalidMessagesController < ApplicationController
  before_action :set_invalid_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /invalid_messages
  def index
    @invalid_messages = InvalidMessage.all
  end

  # GET /invalid_messages/1
  def show
  end

  # GET /invalid_messages/new
  def new
    @invalid_message = InvalidMessage.new
  end

  # GET /invalid_messages/1/edit
  def edit
  end

  # POST /invalid_messages
  def create
    @invalid_message = InvalidMessage.new(invalid_message_params)

    if @invalid_message.save
      redirect_to @invalid_message, notice: 'Invalid message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invalid_messages/1
  def update
    if @invalid_message.update(invalid_message_params)
      redirect_to @invalid_message, notice: 'Invalid message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invalid_messages/1
  def destroy
    @invalid_message.destroy
    redirect_to invalid_messages_url, notice: 'Invalid message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invalid_message
      @invalid_message = InvalidMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invalid_message_params
      params.require(:invalid_message).permit(:read, :reason, :content, :source)
    end
end
