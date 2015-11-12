class Post < ActiveRecord::Base
  include Searchable
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, uniqueness: true

  def comments_by_date
    comments.order("created_at DESC")
  end

  def teaser(length)
    if length
      "#{body[0..length]}..."
    else
      body
    end
  end

end
