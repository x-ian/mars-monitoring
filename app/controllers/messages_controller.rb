class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, :except => [:create_from_probe]

  protect_from_forgery :except => :create
  protect_from_forgery :except => :create_from_probe

  # GET /messages
  def index
#    @messages = Message.all
    @messages = Message.where("archived is null or archived = :archived", archived: false).order('server_time DESC').paginate(:page => params[:page], per_page: 100)
  end

  def index_archived
    @messages = Message.where("archived = :archived", archived: true).order('server_time DESC').paginate(:page => params[:page], per_page: 100)
  end

  # GET /messages/1
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
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
        notifications_forward_to_all @message
        notifications_alarm_from_heartbeat(@message)
        notifications_restart_from_heartbeat(@message)
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
          notifications_forward_to_all(@message)
          notifications_alarm_from_heartbeat(@message)
          notifications_restart_from_heartbeat(@message)
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

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
params.require(:message).permit(:device_time, :device_uptime, :message_type_id, :outgoing_message_count, :probe_id, :restart_count, :value1, :value2, :value3, :value4, :value5, :value6, :value7, :value8, :value9, :value10, :value11, :value12, :value13, :value14, :value15, :value16, :server_time, :probe_enabled, :archived)
    end
    
    def notifications_forward_to_all(m)
      if !m.probe.forward_subscription.nil? &&
        ((m.probe.forward_subscription.include_alarm && m.message_type.isAlarm?) ||
        (m.probe.forward_subscription.include_restart && m.message_type.isRestart?) ||
        (m.probe.forward_subscription.include_heartbeat && m.message_type.isHeartbeat?))
      
        n = Notification.new(:notification_reason_id => NotificationReason::FORWARD, :probe_id => m.probe_id, :message_id => m.id, :invalid_message_id => nil, :event_id => nil, :notification_channel_id => NotificationChannel::MAIL, :scheduled_at => Time.now)
        n.save
      end
    end
  
    def notifications_alarm_from_heartbeat(m)
      previous_m = Message.where("probe_id = :probe_id and id < :message_id", :probe_id => m.probe_id, :message_id => m.id).last
      if value_newly_above_threshold(m.value1, previous_m.value1, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value2, previous_m.value2, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value3, previous_m.value3, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value4, previous_m.value4, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value5, previous_m.value5, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value6, previous_m.value6, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value7, previous_m.value7, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value8, previous_m.value8, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value9, previous_m.value9, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value10, previous_m.value10, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value11, previous_m.value11, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value12, previous_m.value12, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value13, previous_m.value13, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value14, previous_m.value14, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value15, previous_m.value15, m.probe.probe_configuration.value1_threshold) ||
        value_newly_above_threshold(m.value16, previous_m.value16, m.probe.probe_configuration.value1_threshold)
        if !m.probe.forward_subscription.nil? &&
          (m.probe.forward_subscription.generate_alarm_from_heartbeat && m.message_type.isHeartbeat?)
          n = Notification.new(:notification_reason_id => NotificationReason::ALARM, :probe_id => m.probe_id, :message_id => m.id, :invalid_message_id => nil, :event_id => nil, :notification_channel_id => NotificationChannel::MAIL, :scheduled_at => Time.now)
          n.save
        end
      end
    end

    def value_newly_above_threshold(value, previous_value, value_threshold)
      return !value_threshold.nil? && !value.nil? && value >= value_threshold && (previous_value.nil? || previous_value < value_threshold)
    end

    def notifications_restart_from_heartbeat(m)
      previous_m = Message.where("probe_id = :probe_id and id < :message_id", :probe_id => m.probe_id, :message_id => m.id).last
      if !m.restart_count.nil? && !previous_m.restart_count.nil? && m.restart_count > previous_m.restart_count
        if !m.probe.forward_subscription.nil? &&
          (m.probe.forward_subscription.generate_restart_from_heartbeat && m.message_type.isHeartbeat?)
          n = Notification.new(:notification_reason_id => NotificationReason::RESTART, :probe_id => m.probe_id, :message_id => m.id, :invalid_message_id => nil, :event_id => nil, :notification_channel_id => NotificationChannel::MAIL, :scheduled_at => Time.now)
          n.save
        end
      end
    end

  
end
