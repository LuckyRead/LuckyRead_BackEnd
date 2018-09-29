# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[User, Fragment, Topic, Sub_topic, Comment, Response, User_fragment].each(&:delete_all)

User.populate 20 do |user|
    user.name = Faker::Name.first_name
    user.lastname = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password
    user.score = Faker::Number.between(1, 10)
    user.talk_to_us = Faker::String.random
    Comment.populate 100..20 do |comment|
        command.message = Faker::String.random
        Response.populate 100..100 do |response|
            response.idresponse = Faker::Numbre.unique.random
            response.date = Faker::Date.backward(14)
            response.message = Faker::String.random
            response.comment_idcoment = comment.idcomment
            response.user_username = user.user_username
    end
end

Fragment.populate 100 do |fragment|    
    fragment.idfragment = Faker::Number.unique.random
    fragment.title = Faker::String.random
    fragment.introduction = Faker::String.random
    fragment.source = Faker::Internet.url
    user.score = Faker::Number.between(1, 10)
    Topic.populate 20..100 do |topic|
        topic.score = Faker::Number.between(1, 100)
        Sub_topic.populate 10..20 do |product|
            sub_topic.idfragment = fragment.idfragment
            sub_topic.name = topic.name
        end
    end
end

User_fragment.populate 100 do |user_fragment|
    user_fragment.iduserfragment = Faker::Numbre.unique.random
    user_fragment.title = Faker::String.random
    user_fragment.introduction = Faker::String.random
    user_fragment.content = Faker::String.random
    user_fragment.source = Faker::Internet.url
    user_fragment.score = Faker::Number.between(1, 10)
    user_fragment.state = [published, not_published]
end


