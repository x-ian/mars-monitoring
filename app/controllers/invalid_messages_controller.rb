class InvalidMessagesController < ApplicationController
  # GET /invalid_messages
  # GET /invalid_messages.json
  def index
    @invalid_messages = InvalidMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invalid_messages }
    end
  end

  # GET /invalid_messages/1
  # GET /invalid_messages/1.json
  def show
    @invalid_message = InvalidMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invalid_message }
    end
  end

  # GET /invalid_messages/new
  # GET /invalid_messages/new.json
  def new
    @invalid_message = InvalidMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invalid_message }
    end
  end

  # GET /invalid_messages/1/edit
  def edit
    @invalid_message = InvalidMessage.find(params[:id])
  end

  # POST /invalid_messages
  # POST /invalid_messages.json
  def create
    @invalid_message = InvalidMessage.new(params[:invalid_message])

    respond_to do |format|
      if @invalid_message.save
        format.html { redirect_to @invalid_message, notice: 'Invalid message was successfully created.' }
        format.json { render json: @invalid_message, status: :created, location: @invalid_message }
      else
        format.html { render action: "new" }
        format.json { render json: @invalid_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invalid_messages/1
  # PUT /invalid_messages/1.json
  def update
    @invalid_message = InvalidMessage.find(params[:id])

    respond_to do |format|
      if @invalid_message.update_attributes(params[:invalid_message])
        format.html { redirect_to @invalid_message, notice: 'Invalid message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invalid_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invalid_messages/1
  # DELETE /invalid_messages/1.json
  def destroy
    @invalid_message = InvalidMessage.find(params[:id])
    @invalid_message.destroy

    respond_to do |format|
      format.html { redirect_to invalid_messages_url }
      format.json { head :no_content }
    end
  end
end
