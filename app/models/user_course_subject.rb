class UserCourseSubject < ActiveRecord::Base
  belongs_to :user_course
  belongs_to :user_subject
end
