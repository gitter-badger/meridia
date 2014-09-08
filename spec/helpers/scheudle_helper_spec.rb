require 'spec_helper'

describe ScheduleHelper do
  describe "#lesson"do
    before(:each)do
      @attr = {
        _day: :monday,
        hour: 10,
        minutes: 0,
       length: 4
      }
    end
    context "when print acticty#index" do
      it "return Objet organazed to hours" do
        lesson = Lesson.new(@attr) 
        activity =  FactoryGirl.create(:activity)
        activity.lessons << lesson
        activities = Activity.all
        res = helper.lesson(activities) 
        lessons = 0
        res.each_with_index do |hours, index|
            if hours
              lessons += hours[1].length 
            end
          end
        expect(lessons).to eq(4)

      end
    end
  end
end
