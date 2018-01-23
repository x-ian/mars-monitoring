require 'ostruct'

class VisualizeTextController < ApplicationController
  before_action :authenticate_user!

  def index
    @probe = (params[:probe_id].blank? ? Probe.find(1) : Probe.find(params[:probe_id]))
    @start_date = (params[:start_date].blank? ? Time.now - 7.days : DateTime.strptime(params[:start_date], "%Y-%m-%d"))
    @end_date  = (params[:end_date].blank? ? Time.now + 1.day : DateTime.strptime(params[:end_date], "%Y-%m-%d") + 1.day)
    # stupid workaround to make datepicker use a preset value without a proper rails model
#    @foo = OpenStruct.new(:start_date => (params[:foo].blank? || params[:foo][:start_date].blank? ? '' : params[:foo][:start_date]), :end_date => (params[:foo].blank? || params[:foo][:end_date].blank? ? '' : params[:foo][:end_date]))
    
    @current_probe_id = @probe.id
    
    value1_type = false
    value2_type = false
    value3_type = false
    value4_type = false
    value5_type = false
    value6_type = false
    value7_type = false
    value8_type = false
    value9_type = false
    value10_type = false
    value11_type = false
    value12_type = false
    value13_type = false
    value14_type = false
    value15_type = false
    value16_type = false
    value1_threshold = @probe.probe_configuration.value1_threshold
    value2_threshold = @probe.probe_configuration.value2_threshold
    value3_threshold = @probe.probe_configuration.value3_threshold
    value4_threshold = @probe.probe_configuration.value4_threshold
    value5_threshold = @probe.probe_configuration.value5_threshold
    value6_threshold = @probe.probe_configuration.value6_threshold
    value7_threshold = @probe.probe_configuration.value7_threshold
    value8_threshold = @probe.probe_configuration.value8_threshold
    value9_threshold = @probe.probe_configuration.value9_threshold
    value10_threshold = @probe.probe_configuration.value10_threshold
    value11_threshold = @probe.probe_configuration.value11_threshold
    value12_threshold = @probe.probe_configuration.value12_threshold
    value13_threshold = @probe.probe_configuration.value13_threshold
    value14_threshold = @probe.probe_configuration.value14_threshold
    value15_threshold = @probe.probe_configuration.value15_threshold
    value16_threshold = @probe.probe_configuration.value16_threshold

    @value_type1 = @probe.probe_type.value1_type.name
    @value_type2 = @probe.probe_type.value2_type.name
    @value_type3 = @probe.probe_type.value3_type.name
    @value_type4 = @probe.probe_type.value4_type.name
    @value_type5 = @probe.probe_type.value5_type.name unless @probe.probe_type.value5_type.nil?
    @value_type6 = @probe.probe_type.value6_type.name unless @probe.probe_type.value6_type.nil?
    @value_type7 = @probe.probe_type.value7_type.name unless @probe.probe_type.value7_type.nil?
    @value_type8 = @probe.probe_type.value8_type.name unless @probe.probe_type.value8_type.nil?
    @value_type9 = @probe.probe_type.value9_type.name unless @probe.probe_type.value9_type.nil?
    @value_type10 = @probe.probe_type.value10_type.name unless @probe.probe_type.value10_type.nil?
    @value_type11 = @probe.probe_type.value11_type.name unless @probe.probe_type.value11_type.nil?
    @value_type12 = @probe.probe_type.value12_type.name unless @probe.probe_type.value12_type.nil?
    @value_type13 = @probe.probe_type.value13_type.name unless @probe.probe_type.value13_type.nil?
    @value_type14 = @probe.probe_type.value14_type.name unless @probe.probe_type.value14_type.nil?
    @value_type15 = @probe.probe_type.value15_type.name unless @probe.probe_type.value15_type.nil?
    @value_type16 = @probe.probe_type.value16_type.name unless @probe.probe_type.value16_type.nil?
    
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
    if !pt.value5_type.nil? && pt.value5_type_id != ValueType::NOT_CONFIGURED
      value5_type = true
      tsv += "\t#{pt.value5_type.name}_5\t#{pt.value5_type.name} threshold_5";
    end
    if !pt.value6_type.nil? && pt.value6_type_id != ValueType::NOT_CONFIGURED
      value6_type = true
      tsv += "\t#{pt.value6_type.name}_6\t#{pt.value6_type.name} threshold_6";
    end
    if !pt.value7_type.nil? && pt.value7_type_id != ValueType::NOT_CONFIGURED
      value7_type = true
      tsv += "\t#{pt.value7_type.name}_7\t#{pt.value7_type.name} threshold_7";
    end
    if !pt.value8_type.nil? && pt.value8_type_id != ValueType::NOT_CONFIGURED
      value8_type = true
      tsv += "\t#{pt.value8_type.name}_8\t#{pt.value8_type.name} threshold_8";
    end
    if !pt.value9_type.nil? && pt.value9_type_id != ValueType::NOT_CONFIGURED
      value9_type = true
      tsv += "\t#{pt.value9_type.name}_9\t#{pt.value9_type.name} threshold_9";
    end
    if !pt.value10_type.nil? && pt.value10_type_id != ValueType::NOT_CONFIGURED
      value10_type = true
      tsv += "\t#{pt.value10_type.name}_10\t#{pt.value10_type.name} threshold_10";
    end
    if !pt.value11_type.nil? && pt.value11_type_id != ValueType::NOT_CONFIGURED
      value11_type = true
      tsv += "\t#{pt.value11_type.name}_11\t#{pt.value11_type.name} threshold_11";
    end
    if !pt.value12_type.nil? && pt.value12_type_id != ValueType::NOT_CONFIGURED
      value12_type = true
      tsv += "\t#{pt.value12_type.name}_12\t#{pt.value12_type.name} threshold_12";
    end
    if !pt.value13_type.nil? && pt.value13_type_id != ValueType::NOT_CONFIGURED
      value13_type = true
      tsv += "\t#{pt.value13_type.name}_13\t#{pt.value13_type.name} threshold_13";
    end
    if !pt.value14_type.nil? && pt.value14_type_id != ValueType::NOT_CONFIGURED
      value14_type = true
      tsv += "\t#{pt.value14_type.name}_14\t#{pt.value14_type.name} threshold_14";
    end
    if !pt.value15_type.nil? && pt.value15_type_id != ValueType::NOT_CONFIGURED
      value15_type = true
      tsv += "\t#{pt.value15_type.name}_15\t#{pt.value15_type.name} threshold_15";
    end
    if !pt.value16_type.nil? && pt.value16_type_id != ValueType::NOT_CONFIGURED
      value16_type = true
      tsv += "\t#{pt.value16_type.name}_16\t#{pt.value16_type.name} threshold_16";
    end
    tsv += "\n"

    @messages = Message.where('probe_id = :probe_id AND server_time >= :start_date AND server_time <= :end_date', probe_id: @probe.id, start_date: @start_date, end_date: @end_date).order('server_time DESC').paginate(:page => params[:page], per_page: 100)

    @messages_xls = Message.where('probe_id = :probe_id AND server_time >= :start_date AND server_time <= :end_date', probe_id: @probe.id, start_date: @start_date, end_date: @end_date).order('server_time DESC').limit(5000)
    respond_to do |format|
      format.html
      format.xls do
        render :xls => @messages_xls,
                       :columns => [ :probe_id, :message_type_id, :value1, :value2, :value3, :value4, :value5, :value6, :value7, :value8, :value9, :value10, :value11, :value12, :value13, :value14, :value15, :value16, :server_time, :outgoing_message_count, :restart_count ],
                       :headers => %w[ probe_id message_type value1 value2 value3 value4 value5 value6 value7 value8 value9 value10 value11 value12 value13 value14 value15 value16 server_time outgoing_message_count restart_count ]
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
