class Spot < ApplicationRecord
  
  has_many :reviews, dependent: :destroy
  has_many :post_spots, dependet: :destroy
  has_many :posts, through: :post_spots
  belongs_to :work
  
   has_one_attached :spot_image
    # 画像の表示
  def get_spot_image(width, height)
    unless spot_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      spot_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    spot_image.variant(resize_to_limit: [width, height]).processed
  end
end
