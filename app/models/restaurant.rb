class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  belongs_to :admin_user
  has_many :menus, dependent: :destroy
  has_many :dishes, through: :menus
  has_many :dish_categories, through: :dishes
  has_many :reviews
  has_attached_file :image,
                    storage: :s3,
                    s3_credentials: {
                        bucket: ENV['AWS_BUCKET'],
                        access_key_id: ENV['AWS_ACCESS_KEY'],
                        secret_access_key: ENV['AWS_SECRET_KEY'],
                        s3_region: ENV['AWS_REGION'],
                        url: ':s3_domain_url',
                        s3_host_name: "s3-#{ENV['AWS_REGION']}.amazonaws.com"
                    },
                    default_url: "/#{Rails.root}public/default_pic.jpg"

  validates_attachment :image,
                       content_type:
                           {content_type: %w(image/jpg image/jpeg image/png image/gif)}


  geocoded_by :address

  validates :address, presence: true
  after_validation :geocode

  def self.for_markers
    all.to_a.map(&:serializable_hash).map do |restaurant|
      {name: restaurant['name'],
       latitude: restaurant['latitude'],
       longitude: restaurant['longitude'],
       description: restaurant['description'],
       id: restaurant['id']}
    end
  end
end
