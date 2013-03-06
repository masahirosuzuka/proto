class Profile < ActiveRecord::Base
  attr_accessible :description, :profile_image_url, :user_id, :username

  validates_uniqueness_of :user_id

  # Useraccount
  belongs_to :user

  # Post
  has_many :post, :dependent => :destroy

  # Friendship
  has_many :friendships, :foreign_key => :user_id, :dependent => :destroy
  has_many :friends, :through => :friendships, :foreign_key => :user_id

  # Follow
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => :friend_id, :dependent => :destroy
  has_many :inverse_frends, :through => :inverse_friendships, :source => :profile, :foreign_key => :user_id
end
