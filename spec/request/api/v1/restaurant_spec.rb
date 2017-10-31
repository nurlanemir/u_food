require 'rails_helper'

RSpec.describe 'Restaurant', type: :request do
  let(:headers) {{HTTP_ACCEPT: 'application/json'}}

  describe 'Get api/v1/restaurants' do
    let(:restaurant_category) {FactoryGirl.create(:restaurant_category, name: 'Thai food', description: 'Thai food')}
    let!(:restaurant) {FactoryGirl.create(:restaurant, name: 'My Thai', address: 'street 1', description: 'boring food', latitude: 33.7353997, longitude: 73.0781967, restaurant_category_id: restaurant_category.id)}

    it 'returns collection of restaurants' do

      get '/api/v1/restaurants'

      expected_response = {"data" =>
                               {"restaurants" =>
                                    [{"restaurant_name" => "My Thai",
                                      "restaurant_address" => "street 1",
                                      "restaurant_description" => "boring food",
                                      "restaurant_latitude" => 33.7353997,
                                      "restaurant_longitude" => 73.0781967,
                                      "restaurant_categories" =>
                                          [{"restaurant_category_name" => "Thai food",
                                            "restaurant_category_description" => "Thai food"}]}]}}


      expect(response.status).to eq 200
      expect(response_json).to eq expected_response
    end
  end
end
