class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_user_name

  def get_user_name
    @user = current_user
  end
end
