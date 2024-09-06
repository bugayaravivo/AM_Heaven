class Work < ApplicationRecord
  
  has_many :reviews, dependent: :destroy
  has_many :spots, dependent: :destroy
  
   has_one_attached :work_image
    # 画像の表示
  def get_work_image(width, height)
    unless work_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      work_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    work_image.variant(resize_to_limit: [width, height]).processed
  end
end
