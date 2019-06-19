class CreateLecture < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title

      t.timestamps
    end

    add_reference :lectures, :course, foreign_key: true
  end
end
