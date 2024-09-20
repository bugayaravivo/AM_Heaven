class Review < ApplicationRecord
  belongs_to :user
  belongs_to :work, optional: true
  belongs_to :spot, optional: true
  
  validate :work_or_spot_present    #spot_idかwork_idのどちらかは必要だと要求するバリデーション
  validates :rating, presence: true
  
  private
  # カスタムバリデーションメソッド
  def work_or_spot_present
    if work_id.blank? && spot_id.blank?
      errors.add(:base, "作品または聖地を選択してください")
    end
  end
end
