class RemoveCourseFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :course_id
  end
end
