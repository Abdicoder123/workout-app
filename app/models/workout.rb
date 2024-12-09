class Workout < ApplicationRecord
  belongs_to :user, optional: false
  validates :name, presence: true
  validates :description, presence: true

end
