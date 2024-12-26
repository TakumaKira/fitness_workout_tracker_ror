class Workout < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  # Add any other validations you need
end
