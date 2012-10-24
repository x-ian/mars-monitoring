class DashboardController < ApplicationController
  def show
    @probe_types = ProbeType.all.find_all
    @locations = Location.all.find_all{|l| l.isLeaf?}
  end
  
end
