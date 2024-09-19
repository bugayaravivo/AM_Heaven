class Review < ApplicationRecord
  
  
  belongs_to :user
  belongs_to :work
  belongs_to :spot
end
