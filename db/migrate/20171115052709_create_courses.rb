class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
  end
end
