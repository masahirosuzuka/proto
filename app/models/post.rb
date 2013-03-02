class Post < ActiveRecord::Base
  attr_accessible :body, :link, :title, :user_id

  belongs_to :profile
  has_many :comment, :dependent => :destroy
end
