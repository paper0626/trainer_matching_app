class Like < ApplicationRecord
  validates :user_id, {presence: true}
  validates :trainer_id, {presence: true}
  
end
