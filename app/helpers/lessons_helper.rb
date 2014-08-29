module LessonsHelper
  def lessons lessons
    schedule = Array.new (8..18).map{|u| Hash[Lesson::DAY.map {|d| [d,Array.new]} ] }
    day=Hash.new
    lessons.each do |lesson|
      schedule[lesson.hour-8][lesson.day] << lesson.activity.title
      if lesson.length > 1
        (lesson.hour + 2..lesson.hour + lesson.length).map do |hour|
          schedule[hour-8][lesson.day] << lesson.activity.title
        end
      end
    end
    schedule
  end
end
