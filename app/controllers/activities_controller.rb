class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity.areas.each do |area|
      puts area.intermediate?
    end
  end

  # GET /activities/new
  def new
    Mongoid::Multitenancy.current_tenant = Center.find(current_user.center)
    @activity = Activity.new
    @activity.areas.build( kindof: :cognitive, level: [ :basic, :intermediate, :advanced ])
    @activity.areas.build( kindof: :physical, level: [ :basic, :intermediate, :advanced ] )
    @activity.areas.build( kindof: :personaldev, level: [ :basic, :intermediate, :advanced ] )
    @activity.areas.build( kindof: :social, level: [ :basic, :intermediate, :advanced ] )
    @activity.lessons.build
    #hours = (0..24).map{ |h| h.to_i > 9 ? h : '%s%s' % [0, h] }
    #minutes = 10.step(50,10).map{ |h| h }
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    areas_attributes = activity_params[:areas_attributes]

    #set levels
    areas = []
    areas_attributes.each do |i, a|
      area = Area.new( kindof: a['kindof'] )
      a['level'].each do |l| 
        area.level << l.to_sym
      end
      areas.push area
    end

    activity = activity_params.except :areas_attributes
    @activity = Activity.new(activity)
    @activity.areas = areas

    respond_to do |format|
      if @activity.save!
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    areas_attributes = activity_params[:areas_attributes]

    #set levels
    areas = []
    areas_attributes.each do |i, a|
      area = {}
      levels = []
      a['level'].each do |l| 
        levels << l.to_sym
      end
      area['id'] = a['id']
      area['kindof'] = a['kindof']
      area['level'] = levels

      areas.push area
    end

    activity = activity_params.except :areas_attributes
    activity[ 'areas_attributes' ] = areas


    respond_to do |format|
      if @activity.update(activity)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :description, :participants, :objective, :areas_attributes => [ :id, :_destroy, :kindof, :level => [] ], :lessons_attributes => [:id, :_destroy, :day, :hour, :minutes, :length] )
    end
end
