class Recipe < ApplicationRecord
  has_many :steps

  module Cuisine
    INDIAN = 'Indian'
    AMERICAN = 'American'
    ITALIAN = 'Italian'

    def self.all
      constants.each { |c| const_get(c) }
    end
  end

  validates :name, presence: true
  validates :cuisine, inclusion: { in: Cuisine.all, message: "%{value} is not a valid cuisine" }
end
