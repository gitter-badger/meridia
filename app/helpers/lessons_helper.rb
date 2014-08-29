module LessonsHelper
  def lessons lessons
    schedule = Array.new (8..18).map{|u| Hash[Lesson::DAY.map {|d| [d,Array.new]} ] }
    day=Hash.new
    lessons.each do |lesson|
      if lesson.length > 1
        (lesson.hour..lesson.hour + lesson.length).map do |hour|
          schedule[hour-8][lesson.day] << lesson.activity.title
        end
      else
        schedule[lesson.hour-8][lesson.day] << lesson.activity.title
      end
    end
    schedule
  end
end
