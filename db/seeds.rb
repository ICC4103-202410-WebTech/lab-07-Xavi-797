# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
# Desvincular primero todos los hijos
Post.where.not(parent_post_id: nil).update_all(parent_post_id: nil)
Post.destroy_all

Tag.destroy_all

#User 1
User.create!(
    id: 1,
    name: 'Juan Pérez',
    email: 'jperez@example.com',
    password: '123456789'
)

#User 2
User.create!(
    id: 2,
    name: 'Roberto González',
    email: 'rgonzalez@example.com',
    password: '123456789'
)

#User 3
User.create!(
    id: 3,
    name: 'Magdalena Rodríguez',
    email: 'mrodriguez@example.com',
    password: '123456789'
)

#User 4
User.create!(
    id: 4,
    name: 'John Doe',
    email: 'jdoe@example.com',
    password: '123456789'
)

#User 5
User.create!(
    id: 5,
    name: 'Pedro Guzman',
    email: 'pguzman@example.com',
    password: '123456789'
)

#Post 1
post_1 = Post.create!(
    id: 1,
    title: 'Post 1',
    content: 'Este es el contenido del post 1',
    user_id: 1,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
)

#Post 2
post_2 = Post.create!(
    id: 2,
    title: 'Post 2',
    content: 'Este es el contenido del post 2, hijo del post 1',
    user_id: 1,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
    parent_post_id: 1
)

#Post 3
post_3 = Post.create!(
    id: 3,
    title: 'Post 3',
    content: 'Este es el contenido del post 3, hijo del post 1',
    user_id: 2,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
    parent_post_id: 1
)

#Post 4
post_4 = Post.create!(
    id: 4,
    title: 'Post 4',
    content: 'Este es el contenido del post 4',
    user_id: 3,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
)

#Post 5
post_5 = Post.create!(
    id: 5,
    title: 'Post 5',
    content: 'Este es el contenido del post 5, hijo del post 4',
    user_id: 3,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
    parent_post_id: 4
)

#Post 6
post_6 = Post.create!(
    id: 6,
    title: 'Post 6',
    content: 'Este es el contenido del post 6',
    user_id: 4,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
)

#Post 7
post_7 = Post.create!(
    id: 7,
    title: 'Post 7',
    content: 'Este es el contenido del post 7, hijo del post 6',
    user_id: 4,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
    parent_post_id: 6
)

#Post 8
post_8 = Post.create!(
    id: 8,
    title: 'Post 8',
    content: 'Este es el contenido del post 8, hijo del post 7',
    user_id: 4,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
    parent_post_id: 7
)

#Post 9
post_9 = Post.create!(
    id: 9,
    title: 'Post 9',
    content: 'Este es el contenido del post 9',
    user_id: 5,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
)

#Post 10
post_10 = Post.create!(
    id: 10,
    title: 'Post 10',
    content: 'Este es el contenido del post 10, hijo del post 9',
    user_id: 5,
    published_at: Time.now,
    answers_count: 0,
    likes_count: 0,
    parent_post_id: 9
)

#Tag 1
tag_1 = Tag.create!(
    id: 1,
    name: 'Tag 1'
)

#Tag 2
tag_2 = Tag.create!(
    id: 2,
    name: 'Tag 2'
)

#Tag 3
tag_3 = Tag.create!(
    id: 3,
    name: 'Tag 3'
)

#Tag 4
tag_4 = Tag.create!(
    id: 4,
    name: 'Tag 4'
)

#Tag 5
tag_5 = Tag.create!(
    id: 5,
    name: 'Tag 5'
)


#Tags para post 1
post_1.tags << tag_1
post_1.tags << tag_3
post_1.tags << tag_5


#Tags para post 2
post_2.tags << tag_2
post_2.tags << tag_3


#Tags para post 3
post_3.tags << tag_3
post_3.tags << tag_4

#Tags para post 4
post_4.tags << tag_3

#Tags para post 5
post_5.tags << tag_1
post_5.tags << tag_4

#Tags para post 6
post_6.tags << tag_3
post_6.tags << tag_4

#Tags para post 7
post_7.tags << tag_4
post_7.tags << tag_5

#Tags para post 8
post_8.tags << tag_2
post_8.tags << tag_4

#Tags para post 9
post_9.tags << tag_2
post_9.tags << tag_5

#Tags para post 10
post_10.tags << tag_1
post_10.tags << tag_5