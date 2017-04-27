class Micropost < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:255 }
  
  belongs_to :user
  has_many :favorites, dependent: :destroy, foreign_key: 'micropost_id'
  has_many :clipped_users, through: :favorites, class_name: 'User', source: :user
  
end