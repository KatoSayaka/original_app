class Measurement < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :date 
    validates :timezone
  end
  
  validates :value, format: {with: /\A[0-9]+\z/},
             numericality: { only_integer: true }

end
