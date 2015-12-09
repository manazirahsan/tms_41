class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.references :user, index: true, foreign_key: true
      t.integer :target_id
      t.references :course, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.string :action_message

      t.timestamps null: false
    end
  end
end
