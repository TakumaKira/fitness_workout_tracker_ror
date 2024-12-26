class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises, dependent: :destroy
  has_many :exercises, through: :workout_exercises
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true

  accepts_nested_attributes_for :workout_exercises,
    allow_destroy: true,
    reject_if: :all_blank

  def build_workout_exercise
    workout_exercises.build
  end
end
