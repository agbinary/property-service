class NearbyParamsValidator
  include ActiveModel::Model

  attr_accessor :lng, :lat, :property_type, :marketing_type

  validates :marketing_type, inclusion: { in: %w(sell rent), message: "%{value} is not a valid marketing_type" }
  validates :property_type, inclusion: { in: %w(apartment apartment_roof_storey apartment_maisonette penthouse villa multi_family_house
                                                single_family_house mid_terrace_house semi_detached_house end_terrace_house),
                                          message: "%{value} is not a valid property_type" }
  validates :lng, numericality: true
  validates :lat, numericality: true
end
