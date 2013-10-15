class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  #Ordering the microposts
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 250 }
  
  def author
    User.find_by(id: user_id).name
  end
  
  def self.per_page
    5
  end
end
