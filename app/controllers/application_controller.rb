class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_curret_user

  def get_curret_user
    @user = current_user
  end
end
