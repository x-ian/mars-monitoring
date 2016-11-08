class CurrentStatusController < ApplicationController
  before_filter :authenticate_user!

  def aggregation
    @probe_status = ProbeStatus::DISABLED
    @number_probes = Probe.all.size
    Probe.all.find_all do |p| 
      @probe_status = @probe_status.add(p.current_status)
    end
  end

  def by_location
    @statuses = {}
    locations = Location.all.find_all{|l| l.isLeaf?}
    locations.each do |l|
      probe_status = ProbeStatus::DISABLED
      l.probes.each do |p| 
        probe_status = probe_status.add(p.current_status)
      end
      @statuses.update({l => probe_status})
    end
  end

  def by_probe_type
    @statuses = {}
    probe_types = ProbeType.all.find_all
    probe_types.each do |pt|
      probe_status = ProbeStatus::DISABLED
      pt.probes.each do |p| 
        probe_status = probe_status.add(p.current_status)
      end
      @statuses.update({pt => probe_status})
    end
  end

  def by_location_probe_type
    @probe_types = ProbeType.where(true).includes(:probes).where("probes.customer_id" => current_user.customer_id)
    @locations = Location.all.find_all{|l| l.isLeaf? && l.customer_id == current_user.customer_id}
  end
end
