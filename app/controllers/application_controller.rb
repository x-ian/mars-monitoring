class ApplicationController < ActionController::Base
  protect_from_forgery

  around_action :user_time_zone, if: :current_user

  include CanCan::ControllerAdditions

  def after_sign_in_path_for(resource)
    logger.debug 'YES'
    url_for(:action => 'by_location_probe_type', :controller => '/current_status', :only_path => false, :protocol => 'http')
  end
  
  def after_sign_in_path_for_org(resource)
    logger.debug 'YES'
    sign_in_url = url_for(:action => 'by_location_probe_type', :controller => '/current_status', :only_path => false, :protocol => 'http')
    logger.debug sign_in_url
    if request.referer == sign_in_url
      logger.debug  "1"
      super
    else
      logger.debug  "2"
      stored_location_for(resource) || request.referer || root_path
    end
  end
  
  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
