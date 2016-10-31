require 'ostruct'

class VisualizeTextController < ApplicationController
  before_filter :authenticate_user!

  def index
    @probe = (params[:probe_id].blank? ? Probe.find(1) : Probe.find(params[:probe_id]))
    @start_date = (params[:foo].blank? || params[:foo][:start_date].blank? ? DateTime.new(2012-10-01) : DateTime.strptime(params[:foo][:start_date], "%Y-%m-%d"))
    @end_date  = (params[:foo].blank? || params[:foo][:end_date].blank? ? Time.now : DateTime.strptime(params[:foo][:end_date], "%Y-%m-%d") + 1.day)
    # stupid workaround to make datepicker use a preset value without a proper rails model
    @foo = OpenStruct.new(:start_date => params[:foo][:start_date], :end_date => params[:foo][:end_date])
    
    value1_type = false
    value2_type = false
    value3_type = false
    value4_type = false
    value1_threshold = @probe.probe_configuration.value1_threshold
    value2_threshold = @probe.probe_configuration.value2_threshold
    value3_threshold = @probe.probe_configuration.value3_threshold
    value4_threshold = @probe.probe_configuration.value4_threshold

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

    @messages = Message.find :all, :order => 'server_time ASC', :conditions => ['probe_id = ? AND server_time >= ? AND server_time <= ?', @probe.id, @start_date, @end_date]

  end
end
