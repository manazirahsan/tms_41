class CreateUserSubjectTasks < ActiveRecord::Migration
  def change
    create_table :user_subject_tasks do |t|
      t.references :user_subject, index: true, foreign_key: true
      t.references :user_task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
