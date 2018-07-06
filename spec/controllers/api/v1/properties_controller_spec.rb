require 'rails_helper'

describe API::V1::PropertiesController, type: :controller do
  let(:valid_nearby_params_found) do
    {
      lng: 13.4236807,
      lat: 52.5342963,
      property_type: 'apartment',
      marketing_type: 'sell'
    }
  end

  let(:valid_nearby_params_not_found) do
    {
      lng: 13.4236807,
      lat: 52.5342963,
      property_type: 'apartment_maisonette',
      marketing_type: 'rent'
    }
  end

  let(:invalid_nearby_params) do
    {
      lng: 13.4236807,
      lat: 52.5342963,
      property_type: 'house',
      marketing_type: 'sell'
    }
  end

  let(:successful_response) do
    load_json_symbolized('properties/successful_response.json')
  end

  let(:response_body) { JSON.parse(response.body) }

  describe '#nearby' do
    context 'when params are valid' do
      context 'when data is found' do
        it 'responds with the nearby data' do
          get :nearby, params: valid_nearby_params_found

          expect(response_body).to eq(successful_response.flatten)
        end

        it 'responds with successful status' do
          get :nearby, params: valid_nearby_params_found

          expect(response).to have_http_status 200
        end
      end

      context 'when data is not found' do
        it 'responds with no data was found' do
          get :nearby, params: valid_nearby_params_not_found

          expect(response_body).to eq({'error'=>'No data was founded'})
        end

        it 'responds with not found status' do
          get :nearby, params: valid_nearby_params_not_found

          expect(response).to have_http_status 404
        end
      end
    end

    context 'when params are invalid' do
      it 'raises an exception' do
        expect do
          get :nearby, params: invalid_nearby_params
        end.to raise_error(Exceptions::InvalidInputParamsError)
      end
    end
  end
end
