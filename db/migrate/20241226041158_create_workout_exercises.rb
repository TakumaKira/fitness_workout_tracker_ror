class CreateWorkoutExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_exercises do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.decimal :weight
      t.text :notes

      t.timestamps
    end
  end
end