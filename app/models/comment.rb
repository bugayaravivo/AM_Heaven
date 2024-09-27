class Comment < ApplicationRecord
  
  validates :body, presence: true, length: {in: 1..500, message: 'は1〜500文字。'}

  belongs_to :user
  belongs_to :post
end
