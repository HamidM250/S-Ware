class VolcoordinatorsController < ApplicationController
  # GET /volcoordinators
  # GET /volcoordinators.json
  def index
    #when going to /volcorrds/ this controller never gets called.... why?
    if current_user != nil #need to check this is the coordinator
      if (current_user.volcoordinator != nil)
	      ActiveRecord::Base.transaction do
	          @volunteers = Volunteer.all
	          @volcoordinator = Volcoordinator.first
	          @whiteboards = Whiteboard.all
	      end
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @volcoordinators }
        end
      else
        redirect_to home_block_path
      end
    else
      redirect_to home_block_path
    end
  end

  # GET /volcoordinators/1
  # GET /volcoordinators/1.json
  def show
    if current_user != nil
      @volcoordinator = Volcoordinator.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @volcoordinator }
      end
    else
      redirect_to home_block_path
    end
  end

  def newvolunteers
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volcoordinators }
    end
  end

  def orientedvolunteers
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volcoordinators }
    end
  end

  def volunteersforshelterbuddy
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volcoordinators }
    end
  end

  def rejectedvolunteers
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volcoordinators }
    end
  end

  def review
    @volunteer = Volunteer.find(params[:id])
    @reviewtype = params[:reviewtype]

    respond_to do |format|
      format.html
      format.json { render json: @volunteer }
    end
  end

  def approve
    @volunteers = Volunteer.all
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      #New Volunteers
      if params[:reviewtype] == "newvolunteers"
        if params[:option] == "Approve"
          @volunteer.status = "Awaiting Orientation"
          @volunteer.save
          notice = "Approved #{@volunteer.firstname} #{@volunteer.lastname}'s volunteer application. They are now awaiting their orientation."
        elsif params[:option] == "Reject"
          @volunteer.status = "Rejected"
          @volunteer.orientation.numCurrParticipant = @volunteer.orientation.numCurrParticipant - 1
          @volunteer.orientation.save
          @volunteer.orientation_id = 1
          #@volunteer.orientation.numCurrParticipant = @volunteer.orientation.numCurrParticipant + 1
          @volunteer.save
          notice = "Rejected #{@volunteer.firstname} #{@volunteer.lastname}'s volunteer application."
        end

        format.html { redirect_to volcoordinator_newvolunteers_path, notice: notice }
        format.json { render json: @volunteers }
        #Attended Orientation
      elsif params[:reviewtype] == "orientedvolunteers"
        if params[:option] == "Approve"
          @volunteer.status = "Enter into ShelterBuddy"
          @volunteer.save
          notice = "Approved #{@volunteer.firstname} #{@volunteer.lastname} as a volunteer. They now need to be entered into ShelterBuddy"
        elsif params[:option] == "Did Not Show"
          @volunteer.orientation.numCurrParticipant = @volunteer.orientation.numCurrParticipant - 1
          @volunteer.orientation.save
          @volunteer.orientation_id = 1
          @volunteer.save
          notice = "Marked #{@volunteer.firstname} #{@volunteer.lastname} as not attending orientation. They will be emailed and told to select another orientation"
        elsif params[:option] == "Reject"
          @volunteer.status = "Rejected"
          @volunteer.save
          notice = "Rejected #{@volunteer.firstname} #{@volunteer.lastname}'s volunteer application."
        end

        format.html { redirect_to volcoordinator_orientedvolunteers_path, notice: notice }
        format.json { render json: @volunteers }
        #Enter into ShelterBuddy
      elsif params[:reviewtype] == "volunteersforshelterbuddy"
        if params[:option] == "Done"
          @volunteer.status = "In ShelterBuddy"
          @volunteer.save
          notice = "#{@volunteer.firstname} #{@volunteer.lastname} should now be in ShelterBuddy."
        end

        format.html { redirect_to volcoordinator_volunteersforshelterbuddy_path, notice: notice }
        format.json { render json: @volunteers }
      end
    end
  end

=begin
  # GET /volcoordinators/new
  # GET /volcoordinators/new.json
  def new
    @volcoordinator = Volcoordinator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volcoordinator }
    end
  end
=end

  # GET /volcoordinators/1/edit
  def edit
    @volcoordinator = Volcoordinator.find(params[:id])
  end

  # POST /volcoordinators
  # POST /volcoordinators.json
  def create
    @volcoordinator = Volcoordinator.new(params[:volcoordinator])

    respond_to do |format|
      if @volcoordinator.save
        format.html { redirect_to @volcoordinator, notice: 'Volcoordinator was successfully created.' }
        format.json { render json: @volcoordinator, status: :created, location: @volcoordinator }
      else
        format.html { render action: "new" }
        format.json { render json: @volcoordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volcoordinators/1
  # PUT /volcoordinators/1.json
  def update
    @volcoordinator = Volcoordinator.find(params[:id])

    respond_to do |format|
      if @volcoordinator.update_attributes(params[:volcoordinator])
        format.html { redirect_to @volcoordinator, notice: 'Volcoordinator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @volcoordinator.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /volcoordinators/1
# DELETE /volcoordinators/1.json
  def destroy
    @volcoordinator = Volcoordinator.find(params[:id])
    @volcoordinator.destroy

    respond_to do |format|
      format.html { redirect_to volcoordinators_url }
      format.json { head :no_content }
    end
  end

  def newSupervisor
    @user = User.new
    @user.deptSupervisor = DeptSupervisor.new
  end

  def createSupervisor
    @user = User.new(params[:user])
    @user.deptSupervisor = DeptSupervisor.new(params[:deptsupervisor])
    if @user.save
      redirect_to volcoordinators_url
    else
      render "newSupervisor"
    end
  end

  def departments
    @departments = Department.all
    @roster_coordinators = RosterCoordinator.all
  end

  def activeVols
    @volunteers = Volunteer.all
    @volcoordinator = Volcoordinator.first
  end

end
