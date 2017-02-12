class MessagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create_from_probe]

  protect_from_forgery :except => :create
  protect_from_forgery :except => :create_from_probe

  # GET /messages
  # GET /messages.json
  def index
#    @messages = Message.where("archived is null or archived = :archived", archived: false)
    @messages = Message.where("archived is null or archived = :archived", archived: false).order('server_time DESC').paginate(:page => params[:page], per_page: 100)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages
  # GET /messages.json
  def index_archived
    @messages = Message.where("archived = :archived", archived: true).order('server_time DESC').paginate(:page => params[:page], per_page: 100)

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
  #$MESSAGE_TYPE_ID,$CUSTOMER_ID,$PROBE_ID,$MESSAGE_COUNT,$RESTART_COUNT,$DEVICE_TIME,$VALUE1,$VALUE2,$VALUE3,$VALUE4
    saved = false
    error_message = ""
    
    logger.debug params[:message]
    
    begin
      data = params[:message][:data]
      tokens = data.split(",")

      # message checks
      raise "wrong number of commas" unless data.count(",") == 9 || data.count(",") == 20
      raise "invalid message_type" unless (MessageType.idFor(tokens[0]) > 0 && MessageType.idFor(tokens[0]) < 4)
      raise "probe not found" if Probe.find(tokens[2]).nil?
      raise "invalid date" if DateTime.strptime(tokens[5], '%Y%m%d-%H%M%S').nil?
      
      @message = Message.new
      @message.message_type_id = MessageType.idFor(tokens[0])
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
      if data.count(",") == 20
        @message.value5 = tokens[10]
        @message.value6 = tokens[11]
        @message.value7 = tokens[12]
        @message.value8 = tokens[13]
        @message.value9 = tokens[14]
        @message.value10 = tokens[15]
        @message.value11 = tokens[16]
        @message.value12 = tokens[17]
        @message.value13 = tokens[18]
        @message.value14 = tokens[19]
        @message.value15 = tokens[20]
        @message.value16 = tokens[21]
      end
      
      #    m.server_time(tokens[])
      #   m.probe_enabled(tokens[])
      saved = @message.save
      error_message = @message.errors unless saved
    rescue => e
      error_message += e.to_s
    end
    
    respond_to do |format|
      if saved
        MailNotifier.forward_to_all(@message)
        format.json { render json: @message, status: :created, location: @message }
      else
        m = InvalidMessage.new
        m.read = false
        m.reason = error_message
        m.content = params.to_s
        m.save
#        format.json { render json: @message.errors, status: :unprocessable_entity }
#        MailNotifier.invalid_message(m, User.find(2)).deliver
        format.json { render json: @message, status: :created, location: @message }
      end
    end    
  end

    def create_from_probe_with_server_time
    #$MESSAGE_TYPE_ID,$CUSTOMER_ID,$PROBE_ID,$MESSAGE_COUNT,$RESTART_COUNT,$DEVICE_TIME,$SERVER_TIME,$VALUE1,$VALUE2,$VALUE3,$VALUE4
      saved = false
      error_message = ""

      begin
        data = params[:message][:data]
        tokens = data.split(",")

        # message checks
        raise "wrong number of commas" unless data.count(",") == 10 || data.count(",") == 21
        raise "invalid message_type" unless (MessageType.idFor(tokens[0]) > 0 && MessageType.idFor(tokens[0]) < 4)
        raise "probe not found" if Probe.find(tokens[2]).nil?
        raise "invalid date" if DateTime.strptime(tokens[5], '%Y%m%d-%H%M%S').nil?
        raise "invalid date" if DateTime.strptime(tokens[6], '%Y%m%d-%H%M%S').nil?
        # todo, check if source mobile number matches the probe config. if not, reject the message
        
        @message = Message.new
        @message.message_type_id = MessageType.idFor(tokens[0])
        #   m.customer_id = tokens[1]
        @message.probe_id = tokens[2]
        #    logger.debug tokens[5]
        @message.device_time = DateTime.strptime(tokens[5], '%Y%m%d-%H%M%S')
        # m.device_uptime(tokens[])
        @message.outgoing_message_count = tokens[3]
        @message.restart_count = tokens[4]
        @message.value1 = tokens[7]
        @message.value2 = tokens[8]
        @message.value3 = tokens[9]
        @message.value4 = tokens[10]
        if data.count(",") == 21
          @message.value5 = tokens[11]
          @message.value6 = tokens[12]
          @message.value7 = tokens[13]
          @message.value8 = tokens[14]
          @message.value9 = tokens[15]
          @message.value10 = tokens[16]
          @message.value11 = tokens[17]
          @message.value12 = tokens[18]
          @message.value13 = tokens[19]
          @message.value14 = tokens[20]
          @message.value15 = tokens[21]
          @message.value16 = tokens[22]
        end
        @message.server_time = DateTime.strptime(tokens[6], '%Y%m%d-%H%M%S')
        @message.archived = false
        saved = @message.save
        error_message = @message.errors unless saved
      rescue => e
        error_message += e.to_s
      end

      respond_to do |format|
        if saved
          MailNotifier.forward_to_all(@message)
          if @message.probe.probe_configuration.generate_alarm_from_heartbeat?
            @message.probe.probe_configuration.generate_alarm_from_heartbeat(@message)
          end
          format.json { render json: @message, status: :created, location: @message }
        else
          m = InvalidMessage.new
          m.read = false
          m.reason = error_message
          m.content = params.to_s
          # todo: find a way to get the source mobile number through our sms gateway
          m.source = request.remote_ip
          m.save
  #        format.json { render json: @message.errors, status: :unprocessable_entity }
          format.json { render json: @message, status: :created, location: @message }
        end
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
