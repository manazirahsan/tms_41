class Course < ActiveRecord::Base
  scope :courses_to_be_sent_deadline, -> {where "created_at > :within_two_weeks",
    within_two_weeks: Time.now - 14.days}

  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :trainees, -> {trainees}, class_name: "User", through: :user_courses
  has_many :supervisors, -> {supervisors}, class_name: "User", through: :user_courses

  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects, autosave: true

  enum status: [:open, :continue, :close]
  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}
end
