class CreateWorkoutsWithUserId < ActiveRecord::Migration[7.2]
  def change
      create_table :workouts do |t|
        t.string :name
        t.text :description
        t.string :muscle_group
        t.string :equipment
        t.string :category
        t.references :user, null: false, foreign_key: true  # Adds the user_id column and references the users table
        t.timestamps
      end
  end
end
