class MessagesController < ApplicationController

  protect_from_forgery :except => :create
  protect_from_forgery :except => :create_from_probe

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
       if @message.save
         format.html { redirect_to @message, notice: 'Message was successfully created.' }
         format.json { render json: @message, status: :created, location: @message }
       else
         format.html { render action: "new" }
         format.json { render json: @message.errors, status: :unprocessable_entity }
       end
     end
  end

  def create_from_probe
    # $MESSAGE_TYPE_ID,$CUSTOMER_ID,$PROBE_ID,$MESSAGE_COUNT,$RESTART_COUNT,$DEVICE_TIME,$VALUE1,$VALUE2,$VALUE3,$VALUE4
    data = params[:message][:data]
    tokens = data.split(",")

    @message = Message.new
    @message.message_type_id = parseMessageTypeId(tokens[0])
  #   m.customer_id = tokens[1]
    @message.probe_id = tokens[2]
#    logger.debug tokens[5]
   @message.device_time = DateTime.strptime(tokens[5], '%Y%m%d-%H%M%S')
    # m.device_uptime(tokens[])
    @message.outgoing_message_count = tokens[3]
    @message.restart_count = tokens[4]
    @message.value1 = tokens[6]
    @message.value2 = tokens[7]
    @message.value3 = tokens[8]
    @message.value4 = tokens[9]
#    m.server_time(tokens[])
 #   m.probe_enabled(tokens[])
    
    respond_to do |format|
      if @message.save
        logger.debug " save"
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        logger.debug "no save"
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
     end
  end

  def parseMessageTypeId(id)
    if id == "PAYLOAD"
      return MessageType::PAYLOAD
    elsif id == "HEARTBEAT"
      return MessageType::HEARTBEAT
    elsif id == "RESTART"
      return MessageType::RESTART
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
