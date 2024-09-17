class Work < ApplicationRecord
  
  has_many :reviews, dependent: :destroy
  has_many :spots, dependent: :destroy
  
   has_one_attached :work_image
    # 画像の表示
  
  def get_work_image(width, height)
    if work_image.attached?
      work_image.variant(resize_to_limit: [width, height]).processed
    else
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      work_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      work_image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
  scope :by_first_letter, ->(letter) {
    case letter
    when 'ア'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "ア%", "イ%", "ウ%", "エ%", "オ%")
    when 'カ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "カ%", "キ%", "ク%", "ケ%", "コ%")
    when 'サ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "サ%", "シ%", "ス%", "セ%", "ソ%")
    when 'タ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "タ%", "チ%", "ツ%", "テ%", "ト%")
    when 'ナ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "ナ%", "ニ%", "ヌ%", "ネ%", "ノ%")
    when 'ハ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "ハ%", "ヒ%", "フ%", "ヘ%", "ホ%")
    when 'マ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "マ%", "ミ%", "ム%", "メ%", "モ%")
    when 'ヤ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?", 
            "ヤ%", "ユ%", "ヨ%")
    when 'ラ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?",
            "ラ%", "リ%", "ル%", "レ%", "ロ%")
    when 'ワ'
      where("title_yomi LIKE ? OR title_yomi LIKE ? OR title_yomi LIKE ?", 
            "ワ%", "ヲ%", "ン%")
    else
      all
    end
  }
end
