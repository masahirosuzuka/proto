class Profile < ActiveRecord::Base
  attr_accessible :description, :profile_image_url, :user_id, :username

  belongs_to :user
end
