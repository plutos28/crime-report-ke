class Report < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :type_of_crime, presence: true

  def self.ransackable_associations(auth_object = nil)
    ['photo_attachment', 'photo_blob']
  end


  def self.ransackable_attributes(auth_object = nil)
    # ["created_at", "description", "id", "id_value", "photo", "title", "type_of_crime", "updated_at"]
    column_names
  end
end
