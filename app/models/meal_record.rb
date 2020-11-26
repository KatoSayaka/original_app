class MealRecord < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :date   , presence: true 
  validates :meal_as, presence: true
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
