module PropertiesHelper
  def property_thumbnail property
    img = property.cover_picture.attached? ? property.cover_picture.variant(resize_to_limit: [400, 400]) : "placeholder.png"
    image_tag img, class: "property-thumb"
  end
  # def property_thumbnail_url property
  #   rails_blob_url(property.cover_picture.variant(resize_to_limit: [400, 400]))
  # end
end
