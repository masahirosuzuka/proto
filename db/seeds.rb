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

# Create TestUser1 post
Post.create( title: 'Foobar post1 title',
             body: 'Foobar post1 body',
             user_id: user1.id)

Post.create( title: 'Foobar post2 title',
             body: 'Foobar post2 body',
             user_id: user1.id)

# Create TestUser2
user_data2 = { email: 'hogehoge@foobar.com', 
              password: 'foobarfoobar', 
              password_confirmation: 'foobarfoobar', 
              remember_me: false }
user2 = User.create( user_data2, without_protection: true )

# Create TestUser2 profile
profile_data2 = { username: 'Ms.Hogehoge',
                 description: 'Hello!! I am Hogehoge',
                 profile_image_url: '',
                 user_id: user2.id }
Profile.create( profile_data2 )

# Create TestUser1 post
Post.create( title: 'Hogehoge post1 title',
             body: 'Hogehoge post1 body',
             user_id: user2.id)

Post.create( title: 'Hogehoge post2 title',
             body: 'Hogehoge post2 body',
             user_id: user2.id)
