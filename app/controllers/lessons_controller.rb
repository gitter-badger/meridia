class LessonsController < ApplicationController
  def index
  @lessons = Lesson.all
  end
  def show
  @lesson= Lesson.find(params[:id])
  end
  def create
    @lesson = Lesson.new(lessons_params)
    activity = Activity.find(params[:activity_id])
    activity.lessons << @lesson
    redirect_to lessons_path
  end
  
  private
  def lessons_params
    params.require(:lesson).permit(:hour,:length,:day) 
  end

end
