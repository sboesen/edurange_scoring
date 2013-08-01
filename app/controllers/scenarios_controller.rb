class ScenariosController < ApplicationController
  before_filter :authenticate_user!
  # GET /scenarios
  # GET /scenarios.json
  def index
    @scenarios = Scenario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scenarios }
    end
  end

  # GET /scenarios/1
  # GET /scenarios/1.json
  def show
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scenario }
    end
  end

  # GET /scenarios/new
  # GET /scenarios/new.json
  def new
    authorize! :new, @user, :message => 'Not authorized as an administrator.'
    @scenario = Scenario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scenario }
    end
  end

  # GET /scenarios/1/edit
  def edit
    authorize! :edit, @user, :message => 'Not authorized as an administrator.'
    @scenario = Scenario.find(params[:id])
  end

  # POST /scenarios
  # POST /scenarios.json
  def create
    authorize! :create, @user, :message => 'Not authorized as an administrator.'
    @scenario = Scenario.new(params[:scenario])

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to @scenario, notice: 'Scenario was successfully created.' }
        format.json { render json: @scenario, status: :created, location: @scenario }
      else
        format.html { render action: "new" }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scenarios/1
  # PUT /scenarios/1.json
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      if @scenario.update_attributes(params[:scenario])
        format.html { redirect_to @scenario, notice: 'Scenario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.json
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @scenario = Scenario.find(params[:id])
    @scenario.destroy

    respond_to do |format|
      format.html { redirect_to scenarios_url }
      format.json { head :no_content }
    end
  end
end
