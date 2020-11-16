class MealRecord < ApplicationRecord
  has_one_attached :image
  validate :date
  validate :meal_as

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
