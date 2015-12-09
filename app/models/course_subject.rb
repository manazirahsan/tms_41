class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  has_many :user_subjects
  has_many :users, through: :user_subjects

  has_many :course_subject_tasks
  has_many :tasks, through: :course_subject_tasks
end
