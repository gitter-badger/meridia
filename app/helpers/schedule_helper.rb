module ScheduleHelper
	def lesson(activities, hour, day)
		res = ""
		activities.each do |activity|
			activity.lessons.each do |lesson|
				if lesson.day == day && lesson.hour == hour
					res += "#{activity.title}"
				end

				if lesson.day == day && (lesson.hour + lesson.length) == hour
					res += "#{activity.title}"
				end

			end
		end
		res
	end	
end
