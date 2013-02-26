# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create TestUser1
user_data = { email: 'foobar@foobar.com', 
              password: 'hogehoge', 
              password_confirmation: 'hogehoge', 
              remember_me: false }
user1 = User.create( user_data, without_protection: true )

# Create TestUser1 profile
profile_data = { username: 'Mr.foobar',
                 description: 'Hello!! I am Foobar',
                 profile_image_url: '',
                 user_id: user1.id }
Profile.create( profile_data )

# Create TestUser2
user_data2 = { email: 'hogehoge@foobar.com', 
              password: 'foobarfoobar', 
              password_confirmation: 'foobarfoobar', 
              remember_me: false }
user2 = User.create( user_data2, without_protection: true )

# Create TestUser2 profile
profile_data2 = { username: 'Ms.hogehoge',
                 description: 'Hello!! I am Hogehoge',
                 profile_image_url: '',
                 user_id: user2.id }
Profile.create( profile_data2 )
