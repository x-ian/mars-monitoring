require 'ostruct'

class VisualizeTextController < ApplicationController
  before_filter :authenticate_user!

  def index
    @probe = (params[:probe_id].blank? ? Probe.find(1) : Probe.find(params[:probe_id]))
    @start_date = (params[:foo].blank? || params[:foo][:start_date].blank? ? DateTime.new(2012-10-01) : DateTime.strptime(params[:foo][:start_date], "%Y-%m-%d"))
    @end_date  = (params[:foo].blank? || params[:foo][:end_date].blank? ? Time.now : DateTime.strptime(params[:foo][:end_date], "%Y-%m-%d") + 1.day)
    # stupid workaround to make datepicker use a preset value without a proper rails model
    @foo = OpenStruct.new(:start_date => (params[:foo].blank? || params[:foo][:start_date].blank? ? '' : params[:foo][:start_date]), :end_date => (params[:foo].blank? || params[:foo][:end_date].blank? ? '' : params[:foo][:end_date]))
    
    @current_probe_id = @probe.id
    
    value1_type = false
    value2_type = false
    value3_type = false
    value4_type = false
    value1_threshold = @probe.probe_configuration.value1_threshold
    value2_threshold = @probe.probe_configuration.value2_threshold
    value3_threshold = @probe.probe_configuration.value3_threshold
    value4_threshold = @probe.probe_configuration.value4_threshold

    @value_type1 = @probe.probe_type.value1_type.name
    @value_type2 = @probe.probe_type.value2_type.name
    @value_type3 = @probe.probe_type.value3_type.name
    @value_type4 = @probe.probe_type.value4_type.name
    
    tsv = "date";
    
    pt = @probe.probe_type
    if !pt.value1_type.nil? && pt.value1_type_id != ValueType::NOT_CONFIGURED
      value1_type = true
      tsv += "\t#{pt.value1_type.name}_1\t#{pt.value1_type.name} threshold_1";
    end
    if !pt.value2_type.nil? && pt.value2_type_id != ValueType::NOT_CONFIGURED
      value2_type = true
      tsv += "\t#{pt.value2_type.name}_2\t#{pt.value2_type.name} threshold_2";
    end
    if !pt.value3_type.nil? && pt.value3_type_id != ValueType::NOT_CONFIGURED
      value3_type = true
      tsv += "\t#{pt.value3_type.name}_3\t#{pt.value3_type.name} threshold_3";
    end
    if !pt.value4_type.nil? && pt.value4_type_id != ValueType::NOT_CONFIGURED
      value4_type = true
      tsv += "\t#{pt.value4_type.name}_4\t#{pt.value4_type.name} threshold_4";
    end
    tsv += "\n"

    @messages = Message.where('probe_id = :probe_id AND server_time >= :start_date AND server_time <= :end_date', probe_id: @probe.id, start_date: @start_date, end_date: @end_date).order('server_time DESC').paginate(:page => params[:page], per_page: 100)

    @messages_xls = Message.where('probe_id = :probe_id AND server_time >= :start_date AND server_time <= :end_date', probe_id: @probe.id, start_date: @start_date, end_date: @end_date).order('server_time DESC').limit(5000)
    respond_to do |format|
      format.html
      format.xls do
        render :xls => @messages_xls,
                       :columns => [ :probe_id, :message_type_id, :value1, :value2, :value3, :value4, :server_time, :outgoing_message_count, :restart_count ],
                       :headers => %w[ probe_id message_type value1 value2 value3 value4 server_time outgoing_message_count restart_count ]
      end
    end
  end
  
  def delete_messages_from_here
    message = Message.find(params[:id])
    Message.where('probe_id = :probe_id AND id <= :id', probe_id: message.probe.id, id: message.id).delete_all

    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
  
end
