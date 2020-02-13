class Recipe < ApplicationRecord
  has_many :steps

  after_create :set_external_id

  module Cuisine
    INDIAN = 'Indian'
    AMERICAN = 'American'
    ITALIAN = 'Italian'

    def self.all
      constants.map { |c| const_get(c) }
    end
  end

  validates :name, presence: true
  validates :cuisine, inclusion: { in: Cuisine.all, message: "%{value} is not a valid cuisine" }

  def set_external_id
    self.external_id = ExternalIdGenerator.new(id: id).call
    save!
  end
end
