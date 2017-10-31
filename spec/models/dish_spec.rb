require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'DB table' do
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :description}
    it {is_expected.to have_db_column :price}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :description}
    it {is_expected.to validate_presence_of :price}
  end

  describe 'Associations' do
    it {is_expected.to have_many(:menu_lines)}
    it {is_expected.to have_many(:menus).through(:menu_lines)}
  end

  describe 'Attachment' do
    it { is_expected.to have_attached_file :image}

    it { is_expected.to have_db_column :image_file_name}
    it { is_expected.to have_db_column :image_content_type}
    it { is_expected.to have_db_column :image_file_size}
    it { is_expected.to have_db_column :image_updated_at}
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryGirl.create(:dish)).to be_valid
    end
  end
end