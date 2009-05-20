class RulesetsController < ApplicationController
  # GET /rulesets
  # GET /rulesets.xml
  def index
    @rulesets = Ruleset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rulesets }
    end
  end

  # GET /rulesets/1
  # GET /rulesets/1.xml
  def show
    @ruleset = Ruleset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ruleset }
    end
  end

  # GET /rulesets/new
  # GET /rulesets/new.xml
  def new
    @ruleset = Ruleset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ruleset }
    end
  end

  # GET /rulesets/1/edit
  def edit
    @ruleset = Ruleset.find(params[:id])
  end

  # POST /rulesets
  # POST /rulesets.xml
  def create
    @ruleset = Ruleset.new(params[:ruleset])

    respond_to do |format|
      if @ruleset.save
        flash[:notice] = 'Ruleset was successfully created.'
        format.html { redirect_to(@ruleset) }
        format.xml  { render :xml => @ruleset, :status => :created, :location => @ruleset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ruleset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rulesets/1
  # PUT /rulesets/1.xml
  def update
    @ruleset = Ruleset.find(params[:id])

    respond_to do |format|
      if @ruleset.update_attributes(params[:ruleset])
        flash[:notice] = 'Ruleset was successfully updated.'
        format.html { redirect_to(@ruleset) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ruleset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rulesets/1
  # DELETE /rulesets/1.xml
  def destroy
    @ruleset = Ruleset.find(params[:id])
    @ruleset.destroy

    respond_to do |format|
      format.html { redirect_to(rulesets_url) }
      format.xml  { head :ok }
    end
  end
end
