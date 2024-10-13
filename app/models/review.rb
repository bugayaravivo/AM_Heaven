class Review < ApplicationRecord
  belongs_to :user
  belongs_to :work, optional: true
  belongs_to :spot, optional: true
  
  validate :work_or_spot_present    #spot_idかwork_idのどちらかは必要だと要求するバリデーション
  validates :rating, presence: true
  validates :title, presence: true, length: {in: 1..50}
  validates :body, presence: true, length: {in: 1..1000}
  validate :unique_review
  
  private
  
  
  # カスタムバリデーションメソッド
  def work_or_spot_present
    if work_id.blank? && spot_id.blank?
      errors.add(:base, "作品または聖地を選択してください")
    end
  end
  
  def unique_review
    if work_id.present?
      # 同じユーザーが同じ作品に対してすでにレビューしていないか確認
      if Review.exists?(user_id: user_id, work_id: work_id)
        errors.add(:base, "この作品にはすでにレビュー済みです。")
      end
    elsif spot_id.present?
      # 同じユーザーが同じスポットに対してすでにレビューしていないか確認
      if Review.exists?(user_id: user_id, spot_id: spot_id)
        errors.add(:base, "この聖地にはすでにレビュー済みです。")
      end
    end
  end
end
