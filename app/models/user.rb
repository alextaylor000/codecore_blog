class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # faves
  has_many :favourites
  has_many :favourited_posts, through: :favourites, source: :post

  def full_name
    "#{first_name} #{last_name}"
  end
end
