class AddDateAndDescriptionToWorkouts < ActiveRecord::Migration[8.0]
  def change
    add_column :workouts, :date, :date
    add_column :workouts, :description, :text
  end
end
