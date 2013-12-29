class VolunteersController < ApplicationController

  helper VolunteersHelper

  # GET /volunteers
  # GET /volunteers.json
  def index
    if(current_user == nil)
      redirect_to home_block_path
    elsif(current_user.volcoordinator != nil)
      redirect_to volcoordinator_path 1  #TODO id = 1 is a hack, remove
    end
    @volcoordinator = Volcoordinator.first
  end

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
    if(current_user == nil)
      redirect_to home_block_path
    else
      @volunteer = Volunteer.find(params[:id])
      @volcoordinator = Volcoordinator.first

      respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @volunteer }
      end
    end
  end

  # GET /volunteers/new
  # GET /volunteers/new.json
  def new
    @volunteer = Volunteer.new

 #   respond_to do |format|
  #    format.html # new.html.erb
   #   format.json { render json: @volunteer }
  #  end
  end

  # GET /volunteers/1/edit
  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(params[:volunteer])
    @volunteer.status = "New"
    
    respond_to do |format|
      if @volunteer.save
        @volunteer.orientation.numCurrParticipant = @volunteer.orientation.numCurrParticipant + 1
	@volunteer.orientation.save
        format.html { 
              redirect_to @volunteer, 
              notice: "Volunteer was successfully created." }
        format.json { 
              render json: @volunteer, status: :created, location: @volunteer }
      else
        format.html { render action: "new" }
        format.json { 
                render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volunteers/1
  # PUT /volunteers/1.json
  def update
    @volunteer = Volunteer.find(params[:id])
    #@user = @volunteer.user
    #@user.email = params[:email]
    #update emil here
    old = @volunteer.orientation
    
    respond_to do |format|
      if @volunteer.update_attributes(params[:volunteer])
	      if old != @volunteer.orientation
	        old.numCurrParticipant = old.numCurrParticipant - 1
	        old.save
	        @volunteer.orientation.numCurrParticipant = @volunteer.orientation.numCurrParticipant + 1
	        @volunteer.orientation.save
	      end
        
        @volunteer.user.email = @volunteer.email
        @volunteer.user.save
        
	      format.html { 
	            redirect_to @volunteer, 
	            notice: 'Volunteer was successfully updated.' }
	      format.json { head :no_content }
      else
	      format.html { render action: "edit" }
	      format.json { 
	            render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy

    respond_to do |format|
      format.html { redirect_to volunteers_url }
      format.json { head :no_content }
    end
  end
end
