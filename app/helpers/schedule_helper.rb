module ScheduleHelper
	#def lesson(activities, hour, day)
	#	res = ""
	#	activities.each do |activity|
	#		activity.lessons.each do |lesson|
	#			if lesson.day == day && lesson.hour == hour
	#				res += "#{activity.title} (#{activity.members.count})"
	#			end
  #
	#			if lesson.day == day && (lesson.hour + lesson.length) == hour
  #					res += "#{activity.title} (#{activity.members.count})"
	#			end
  #
	#		end
	#	end
	#	res
	#end	

  def lesson activities
    res ={}
    lessons =[]
    current_activity = []
    (8..18).map do |hour|
      res["#{hour}"] = Hash.new if !res["#{hour}"].nil?
      d = {}
      Lesson::DAY.map do |day|
        clases = Array.new 
        activities.each do |activity|
          lessons = lesson_activity(activity,current_activity, lessons)
          lessons.each do |lesson| 
            if lesson.day == day && lesson.hour == hour
              clases << activity.title
              d[day] =  clases
              res["#{hour}"] =  d 
            end
          end
        end
      end
    end 
    p res
  end

  def lesson_activity (activity, current,lessons)
      if activity != current 
        lessons = activity.lessons
      end
      lessons.each do |lesson|
        if lesson.length > 1
          (lesson.hour + 2..lesson.hour + lesson.length).map do |hour|
          activity.lessons.build(hour: hour, length: 1)
          end
        end
      end 
    lessons
  end
end
