class UserSubjectTask < ActiveRecord::Base
  belongs_to :user_subject
  belongs_to :user_task
end
