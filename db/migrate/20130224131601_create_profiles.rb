class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :username
      t.text :description
      t.string :profile_image_url

      t.timestamps
    end
  end
end
