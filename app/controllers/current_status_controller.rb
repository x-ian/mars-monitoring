class CurrentStatusController < ApplicationController
  before_filter :authenticate_user!

  def aggregation
    @probe_status = ProbeStatus::DISABLED
    @number_probes = Probe.accessible_by(current_ability).size
    Probe.accessible_by(current_ability).find_all do |p| 
      @probe_status = @probe_status.add(p.current_status)
    end
  end

  def by_location
    @statuses = {}
    locations = Location.accessible_by(current_ability).find_all{|l| l.isLeaf?}
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
      if can? :read, pt
        probe_status = ProbeStatus::DISABLED
        pt.probes.each do |p| 
          probe_status = probe_status.add(p.current_status)
        end
        @statuses.update({pt => probe_status})
      end
    end
  end

  def by_location_probe_type
    #@probe_types = ProbeType.where(true).includes(:probes).where("probes.customer_id" => current_user.customer_id)
    #@probe_types = ProbeType.accessible_by(current_ability).find_all
    @probe_types = []
    pts = ProbeType.all
    pts.each do |pt|
      @probe_types << pt if can? :read, pt
    end
    @locations = Location.accessible_by(current_ability).find_all{|l| l.isLeaf?}
  end
end
