class Property < ApplicationRecord
  belongs_to :account
  has_one_attached :cover_picture
  has_many_attached :pictures
  scope :filter_by_colonia, -> (colonia) { where colonia: colonia }
  scope :filter_by_zona, -> (zona) { where zona: zona }
  scope :filter_by_tipoOp, -> (tipoOp) { where tipoOp: tipoOp }
  scope :filter_by_tipoProp, -> (tipoProp) { where tipoProp: tipoProp }
  # scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}
  # def latest_properties
  #   @property = Property.order("created_on DESC").offset(3).last
  # end
  # scope :featured,:conditions => {:featured_property => true }
  scope :latest, -> { order created_at: :desc }
end
