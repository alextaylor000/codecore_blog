class Post < ActiveRecord::Base
  include Searchable
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  # faves
  has_many :favourites, dependent: :destroy

  mount_uploaders :images, ImagesUploader # multiple selection supported!

  def self.latest(num_posts=10)
    all.order("created_at DESC").limit(num_posts)
  end

  def comments_by_date
    comments.order("created_at DESC")
  end

  def published_date
    created_at.to_formatted_s(:long_ordinal)
  end

  def teaser(length=140)
    if body.length > length 
      "#{body[0..length]}..."
    else
      body
    end
  end

  def faves_count
    extend ActionView::Helpers::TextHelper
    pluralize(favourites.count, "fave")
  end

  def user_has_faved?(user)
    fave_for(user).present?
  end

  def fave_for(user)
    favourites.find_by_user_id(user.id)
  end

  def tags_display
    tags.map(&:name).sort.join(", ")
  end

  def has_images?
    images.present?
  end

end
