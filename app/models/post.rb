class Post < ApplicationRecord
  belongs_to :user
  has_many :post_attachments
 accepts_nested_attributes_for :post_attachments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end
