RSpec.describe 'Restaurant', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:Restaurant) { FactoryGirl.create(:restaurant) }

  describe 'Get api/v1/restaurants' do
    it 'returns collection of restaurants' do
      get '/api/v1/restaurants'

      expect(response.status).to eq 200
    end
  end
end
