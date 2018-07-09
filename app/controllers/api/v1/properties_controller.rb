# app/controllers/api/v1/properties_controller.rb

module API
  module V1
    class PropertiesController < ApplicationController
      def nearby
        nearby_validator = NearbyParamsValidator.new(nearby_params)

        if nearby_validator.valid?
          properties = Property.search_nearby_properties(nearby_params)

          if properties.present?
            render json: properties, status: :ok
          else
            render json: { error: 'No data was found' }, status: :not_found
          end
        else
          render json: {errors: nearby_validator.errors}, status: :unprocessable_entity
        end
      end

      private

      def nearby_params
        params.permit(:lng, :lat, :property_type, :marketing_type)
      end
    end
  end
end
