class Comment < ActiveRecord::Base
  include Searchable
  belongs_to :post
  belongs_to :user
  validates :body, presence: true # TODO: unique to post

  def published_by
    user.full_name
  end

  # TODO: refactor-published-date
  def published_date
    created_at.to_formatted_s(:long_ordinal)
  end

end
