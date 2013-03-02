class Comment < ActiveRecord::Base
  attr_accessible :user_id, :post_id, :body

  belongs_to :post
end
