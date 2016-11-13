module ApplicationHelper
  def current_time_zone
    '<p align="right">All times in timezone of \'' + ActiveSupport::TimeZone[current_user.time_zone].tzinfo.name + '\'</p>'
  end
end
