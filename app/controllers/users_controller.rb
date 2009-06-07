class UsersController < ApplicationController
  before_filter :login_required
  require_role :admin
  
  # render new.rhtml
  def new
    @user = User.new
    @roles = Role.find(:all)
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @roles = Role.find(:all, :order => "name")
    success = @user && @user.save
    if success && @user.errors.empty?
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find_by_id(params[:id])
    @roles = Role.find(:all)
  end

  def update
    @user = User.find_by_id(params[:id])
    @roles = Role.find(params[:user][:roles]) if params[:user][:roles]
    @user.roles = @roles || []

    if @user.save
      flash[:notice] = 'User successfully updated.'
      redirect_to :action => 'show', :id => @user.id
    else
      flash[:error] = 'There was an error updating the user.'
    end
  end
  
  def show
    @user = User.find_by_id(params[:id])
    @roles = @user.roles
  end
end
