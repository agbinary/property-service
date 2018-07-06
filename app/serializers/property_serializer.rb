# app/serializers/property_serializer.rb

class PropertySerializer < ActiveModel::Serializer
  attributes :house_number, :street, :city, :zip_code, :lat, :lng, :price
end
