# app/services/params_validator_service.rb

class ParamsValidatorService < ApplicationService
  include Exceptions

  attr_reader :lng, :lat, :property_type, :marketing_type

  def initialize(lng, lat, property_type, marketing_type)
    @lng = lng
    @lat = lat
    @property_type = property_type
    @marketing_type = marketing_type
  end

  def call
    return if validate_property_type && validate_marketing_type && validate_lngitude && validate_latitude
    message = 'The data is invalid'
    raise Exceptions::InvalidInputParamsError, message
  end

  private

  def validate_property_type
    ['apartment', 'apartment_roof_storey', 'apartment_maisonette', 'penthouse', 'villa', 'multi_family_house',
      'single_family_house', 'mid_terrace_house', 'semi_detached_house', 'end_terrace_house'].include? property_type
  end

  def validate_marketing_type
    ['sell', 'rent'].include? marketing_type
  end

  def validate_lngitude
    lng.is_a? Numeric
  end

  def validate_latitude
    lat.is_a? Numeric
  end
end
