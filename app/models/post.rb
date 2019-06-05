class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  belongs_to :user
  mount_uploader :featured, FeaturedUploader  

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  def self.search(search)
    #MUST USE ILIKE BELOW for production to work, only use LIKE with sqlite
    where("tags ILIKE ?", "%#{search}%")
    #where("body LIKE ?", "%#{search}%")
    #where("title LIKE ?", "%#{search}%")
  end
end
