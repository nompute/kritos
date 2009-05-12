class AdminController < ApplicationController
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:login], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index"})
      else
        flash.now[:notice] = 'Invalid username/password'
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to :action => 'login'
  end

  def index
    if session[:user_id] == nil
      redirect_to :action => 'login'
    end
  end

end
