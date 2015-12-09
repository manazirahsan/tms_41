class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  #has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_blank: true

  has_many :user_courses
  has_many :courses, through: :user_courses

  has_many :user_subjects
  has_many :course_subjects, through: :user_subjects
  has_many :subjects, through: :course_subjects

  has_many :user_tasks
  has_many :tasks, through: :user_tasks



  ROLE = {
      trainee: "Trainee",
      supervisor: "Supervisor"
  }

end
