class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  validates :name, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 150 }
end
