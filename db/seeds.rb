# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Post 2', text: 'I post this to test
')
Post.create(author: second_user, title: 'Code work', text: 'If you see this
that means my code work')
Post.create(author: second_user, title: 'Post 3', text: 'work work')

Comment.create(post: first_post, user: second_user, text: 'Hi Tom!')
Comment.create(post: first_post, user: first_user, text: 'Second comment!')
Comment.create(post: second_post, user: first_user, text: 'comment work!')
