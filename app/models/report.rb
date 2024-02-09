class Report < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :type_of_crime, presence: true
end
