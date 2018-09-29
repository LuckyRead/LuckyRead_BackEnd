# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[SubTopic, Topic, User, Fragment, Comment, Response, UserFragment].each(&:delete_all)

User.Populate 20 do |user|
    user.name = Faker::Name.first_name
    user.lastname = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password
    user.score = Faker::Number.between(1, 10)
    user.talk_to_us = Faker::String.random
    Comment.Populate 100..20 do |comment|
        command.message = Faker::String.random
        Response.Populate 100..100 do |response|
            response.idresponse = Faker::Numbre.unique.random
            response.date = Faker::Date.backward(14)
            response.message = Faker::String.random
            response.comment_idcoment = comment.idcomment
            response.user_username = user.user_username
        end
    end
end

Fragment.Populate 100 do |fragment|    
    fragment.idfragment = Faker::Number.unique.random
    fragment.title = Faker::String.random
    fragment.introduction = Faker::String.random
    fragment.source = Faker::Internet.url
    user.score = Faker::Number.between(1, 10)
    Topic.Populate 20..100 do |topic|
        topic.score = Faker::Number.between(1, 100)
        SubTopic.Populate 10..20 do |subtopic|
            sub_topic.idfragment = fragment.idfragment
            sub_topic.name = topic.name
        end
    end
end

UserFragment.Populate 100 do |userfragment|
    user_fragment.iduserfragment = Faker::Numbre.unique.random
    user_fragment.title = Faker::String.random
    user_fragment.introduction = Faker::String.random
    user_fragment.content = Faker::String.random
    user_fragment.source = Faker::Internet.url
    user_fragment.score = Faker::Number.between(1, 10)
    user_fragment.state = ['published', 'not_published']
end

=begin
100.times do
    User.create(
        username: Faker::Name.unique.first_name,
        name: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        score: Faker::Number.between(1, 10),
        talk_to_us: Faker::String.random
    )
end
=end



