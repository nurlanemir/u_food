require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'factory' do
    it 'is valid' do
      expect(FactoryGirl.create(:restaurant)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :description }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :address }
  end

  describe 'associations' do
      it { is_expected.to belong_to(:restaurant_category) }
      it { is_expected.to belong_to(:admin_user) }
      it { is_expected.to have_many(:menus) }
  end

  describe 'Attachment' do
    it { is_expected.to have_attached_file :image}

    it { is_expected.to have_db_column :image_file_name}
    it { is_expected.to have_db_column :image_content_type}
    it { is_expected.to have_db_column :image_file_size}
    it { is_expected.to have_db_column :image_updated_at}
  end

  describe 'class methods' do
    let!(:restaurants) { 3.times {FactoryGirl.create(:restaurant)} }
    describe '#for_markers' do
      it 'returns a collection' do
        expect(Restaurant.for_markers).to be_an_instance_of Array
      end

      it 'includes all restaurants' do
        expect(Restaurant.for_markers.size).to eq 3
      end
    end
  end
end
