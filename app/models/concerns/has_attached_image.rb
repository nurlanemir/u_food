module HasAttachedImage
  extend ActiveSupport::Concern

  included do
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
  end
end