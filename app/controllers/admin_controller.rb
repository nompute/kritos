class AdminController < ApplicationController
  before_filter :login_required
  require_role :admin 

  def index
    if session[:user_id] == nil
      session[:original_uri] = request.request_uri
      redirect_to :controller => 'users', :action => 'login'
    end
  end
end
