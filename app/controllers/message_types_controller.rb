class MessageTypesController < ApplicationController
  before_action :set_message_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /message_types
  def index
    @message_types = MessageType.all
  end

  # GET /message_types/1
  def show
  end

  # GET /message_types/new
  def new
    @message_type = MessageType.new
  end

  # GET /message_types/1/edit
  def edit
  end

  # POST /message_types
  def create
    @message_type = MessageType.new(message_type_params)

    if @message_type.save
      redirect_to @message_type, notice: 'Message type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /message_types/1
  def update
    if @message_type.update(message_type_params)
      redirect_to @message_type, notice: 'Message type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /message_types/1
  def destroy
    @message_type.destroy
    redirect_to message_types_url, notice: 'Message type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_type
      @message_type = MessageType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_type_params
      params.require(:message_type).permit(:name)
    end
end
