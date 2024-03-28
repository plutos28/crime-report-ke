class Report < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  # validates :title, presence: true
  # validates :description, presence: true
  # validates :type_of_crime, presence: true
  # validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  # validates :status, presence: true, inclusion: { in: %w[pending in_progress resolved] }

  def self.ransackable_associations(auth_object = nil)
    ['photo_attachment', 'photo_blob']
  end

  def photo_url
    if photo.attached?
      Rails.application.routes.url_helpers.url_for(photo)
    else
      nil
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    # ["created_at", "description", "id", "id_value", "photo", "title", "type_of_crime", "updated_at"]
    column_names
  end
end
