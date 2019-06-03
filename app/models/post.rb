class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  mount_uploader :featured, FeaturedUploader  

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true


end
