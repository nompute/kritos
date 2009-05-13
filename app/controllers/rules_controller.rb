class RulesController < ApplicationController
  def index
    @rules = Rule.all
  end

  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(params[:rule])

    if @rule.save
      flash[:notice] = 'Rule was successfully created.'
      redirect_to(rules_url)
    else
      render :action => 'new'
    end
  end

  def show
    @rule = Rule.find(params[:id])
  end

  def destroy
    @rule = Rule.find(params[:id])
    @rule.destroy

    respond_to do |format|
      format.html { redirect_to(rules_url) }
      format.xml { head :ok }
    end
  end

end
