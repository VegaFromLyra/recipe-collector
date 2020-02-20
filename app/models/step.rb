class Step < ApplicationRecord
  belongs_to :recipe

  validates :text, presence: true
  validates :order, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
