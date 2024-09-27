class Spot < ApplicationRecord
  validates :name, presence: true, length: {in: 1..50}
  validates :summary, presence: true, length: {in: 1..1000}
  validates :address, presence: true, length: {in: 1..100}
  validates :spot_image, presence: true
  
  has_many :reviews, dependent: :destroy
  has_many :post_spots, dependent: :destroy
  has_many :posts, through: :post_spots
  belongs_to :work
  
  
  geocoded_by :address
  after_validation :geocode
  
   has_one_attached :spot_image
    # 画像の表示
  def get_spot_image(width, height)
    if spot_image.attached?
      spot_image.variant(resize_to_limit: [width, height]).processed
    else
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      spot_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      spot_image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
  # 平均評価
  def average_rating
    return 0 if reviews.empty?  #レビューがない場合は０を返す
    reviews.average(:rating).to_f.round(1)  #平均評価を小数点１位まで丸める
  end 

end

