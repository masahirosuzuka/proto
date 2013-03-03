class Comment < ActiveRecord::Base
  attr_accessible :user_id, :post_id, :body, :to_user_id

  belongs_to :post
end
