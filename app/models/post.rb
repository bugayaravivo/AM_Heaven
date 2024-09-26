class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_spots, dependent: :destroy
  has_many :spots, through: :post_spots

  validates :title, presence: true, length: {in: 1..50, message: 'は1〜50文字。'}
  validates :body, presence: true, length: {in: 1..1000, message: 'は1〜1000文字。'}

   has_one_attached :post_image
    # 画像の表示
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_post_image_show(width, height)
    if post_image.attached?
      post_image.variant(resize_to_limit: [width, height]).processed
    end
  end
end
