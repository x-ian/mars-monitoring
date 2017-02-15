class VisualizeController < ApplicationController
  before_action :authenticate_user!

  def example_lines
  end
  
  def d3_single_probe
    @probe = (params[:probe_id].blank? ? Probe.find(1) : Probe.find(params[:probe_id]))
    @probe_id = params[:probe_id]
    @start_date = DateTime.new(2012-01-01)
    @end_date  = Time.now
    
    @current_probe_id = @probe_id
  end
  
  def d3_data
    @probe = (params[:probe_id].blank? ? Probe.find(1) : Probe.find(params[:probe_id]))
    @probe_id = params[:probe_id]
    @start_date  = params[:start_date].blank? ? DateTime.new(2012-10-01) : DateTime.strptime(params[:start_date], "%Y-%m-%d")
    @end_date  = (params[:end_date].blank? ? Time.now : DateTime.strptime(params[:end_date], "%Y-%m-%d") + 1.day)
    
    @current_probe_id = @probe_id

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

    # fool d3 as i can't bring the y axis down to 0
    m = Message.where("probe_id = ? AND server_time >= ? AND server_time <= ?", @probe.id, @start_date, @end_date).order("server_time ASC").first
    unless m.nil?
    line = "#{m.server_time.strftime("%Y%m%d-%H%M%S")}"
    line += "\t0\t#{value1_threshold}" if value1_type
    line += "\t0\t#{value2_threshold}" if value2_type
    line += "\t0\t#{value3_threshold}" if value3_type
    line += "\t0\t#{value4_threshold}" if value4_type
    line += "\n"
    tsv << line
    
    messages =     m = Message.where("probe_id = ? AND server_time >= ? AND server_time <= ?", @probe.id, @start_date, @end_date).order("server_time ASC")
    for m in messages
      line = "#{m.server_time.strftime("%Y%m%d-%H%M%S")}"
      line += "\t#{m.value1}\t#{value1_threshold}" if value1_type
      line += "\t#{m.value2}\t#{value2_threshold}" if value2_type
      line += "\t#{m.value3}\t#{value3_threshold}" if value3_type
      line += "\t#{m.value4}\t#{value4_threshold}" if value4_type
      line += "\n"
      tsv << line
    end
   end
    respond_to do |format|
       format.tsv {
         render :text => tsv
       }
     end
  end
end
