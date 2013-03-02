class Profile < ActiveRecord::Base
  attr_accessible :description, :profile_image_url, :user_id, :username

  validates_uniqueness_of :user_id

  belongs_to :user
  has_many :post, :dependent => :destroy
end
