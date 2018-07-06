# app/controllers/api/v1/properties_controller.rb

module API
  module V1
    class PropertiesController < ApplicationController
      def nearby
        lng = nearby_params[:lng].to_f
        lat = nearby_params[:lat].to_f
        property_type = nearby_params[:property_type]
        marketing_type = nearby_params[:marketing_type]

        ParamsValidatorService.call(lng, lat, property_type, marketing_type)
        properties = Property.search_nearby_properties(lng, lat, property_type, marketing_type)

        if properties.present?
          render json: properties, status: :ok
        else
          render json: { error: 'No data was founded' }, status: :not_found
        end
      end

      private

      def nearby_params
        params.permit(:lng, :lat, :property_type, :marketing_type)
      end
    end
  end
end
