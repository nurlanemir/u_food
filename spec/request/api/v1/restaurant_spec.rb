RSpec.describe 'Restaurant', type: :request do
  let(:headers) {{HTTP_ACCEPT: 'application/json'}}

  describe 'Get api/v1/restaurants' do
    restaurant = FactoryGirl.create(:restaurant, name: 'My Thai', address: 'street 1', description: 'boring food')
    restaurant_category = FactoryGirl.create(:restaurant_category, name: 'Thai food', description: 'Thai food')
    restaurant.update(restaurant_category_id: restaurant_category)

    it 'returns collection of restaurants' do
      get '/api/v1/restaurants'

      expected_response = {
          'data': {
        'restaurant_categories': [
            {
                'restaurant_category_name': 'Thai food',
                'restaurant_category_description': 'Thai food',
                'restaurants': [
                    {
                        'restaurant_name': 'My Thai',
                        'restaurant_address': 'street 1',
                        'restaurant_decription': 'boring food'
                    }
                ]
            }
          ]
        }
      }

      expect(response.status).to eq 200
      expect(response_json).to eq expected_response
    end
  end
end
