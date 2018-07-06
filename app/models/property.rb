# app/models/property.rb

class Property < ApplicationRecord
  scope :search_nearby_properties, ->(lng, lat, property_type, marketing_type) { search_by_offer_property_type(property_type, marketing_type).search_by_location(lng, lat) }
  scope :search_by_location, ->(lng, lat) { near([lat, lng], 5, units: :km) }
  scope :search_by_offer_property_type, ->(property_type, marketing_type) { where(property_type: property_type, offer_type: marketing_type) }

  geocoded_by :address, latitude: :lat, longitude: :lng

  def address
    [street, city, zip_code].compact.join(', ')
  end
end
