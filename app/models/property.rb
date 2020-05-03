class Property < ApplicationRecord
  belongs_to :account
  has_one_attached :cover_picture
  # def latest_properties
  #   @property = Property.order("created_on DESC").offset(3).last
  # end
  scope :latest, -> { order created_at: :desc }
end
