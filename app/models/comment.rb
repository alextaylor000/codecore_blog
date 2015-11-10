class Comment < ActiveRecord::Base
  include Searchable
  belongs_to :post
  belongs_to :user
  validates :body, presence: true # TODO: unique to post
end
