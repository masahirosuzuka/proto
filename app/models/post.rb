class Post < ActiveRecord::Base
  attr_accessible :body, :link, :title, :user_id

  belongs_to :profile
end
