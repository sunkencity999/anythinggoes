class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  before_save { self.role ||= :member }
  before_save { self.email = email.downcase }

  validates :email,
  	    presence: true,
            length: { minimum: 6 }
  validates :password, 
            presence: true, 
            length: { minimum: 6 }


  enum role: [:member, :admin]
  
end
