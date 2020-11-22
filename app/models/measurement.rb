class Measurement < ApplicationRecord
  belongs_to :user

  validates :date    , presence: true
  validates :timezone, presence: true
  validates :value   , presence: true

end
