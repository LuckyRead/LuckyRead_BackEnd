# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
[SubTopic, Topic, User, Fragment, Comment, Response, UserFragment].each(&:delete_all)


UserFragment.populate 10 do |userfragment|
    userfragment.iduserfragment = Faker::Number.unique.number(10)
    userfragment.title = Faker::String.random
    userfragment.introduction = Faker::String.random
    userfragment.content = Faker::String.random
    userfragment.source = Faker::Internet.url
    userfragment.score = Faker::Number.between(1, 10)
    userfragment.state = ['published', 'not_published']
end

User.populate 20 do |user|
    user.name = Faker::Name.first_name
    user.lastname = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password
    user.score = Faker::Number.between(1, 10)
    user.talk_to_us = Faker::String.random
    Comment.populate 100..20 do |comment|
        comment.message = Faker::String.random
        Response.populate 100..100 do |response|
            response.idresponse = Faker::Number.unique.number(10)
            response.date = Faker::Date.backward(14)
            response.message = Faker::String.random
            response.comment_idcoment = comment.idcomment
            response.user_username = user.username
        end
    end
end

Fragment.populate 100 do |fragment|    
    fragment.idfragment = Faker::Number.unique.number(10)
    fragment.title = Faker::String.random
    fragment.introduction = Faker::String.random
    fragment.source = Faker::Internet.url
    user.score = Faker::Number.between(1, 10)
    Topic.populate 20..100 do |topic|
        topic.score = Faker::Number.between(1, 100)
        SubTopic.populate 10..20 do |subtopic|
            subtopic.idfragment = fragment.idfragment
            subtopic.name = topic.name
        end
    end
=end

20.times do
    UserFragment.create(
        iduserfragment: Faker::Number.unique.number(5),
        title: Faker::Science.scientist,
        introduction: Faker::HarryPotter.quote,
        content: Faker::HarryPotter.quote,
        source: Faker::Internet.url,
        score: Faker::Number.between(1, 10),
        state: ['published', 'not_published']
    )
end

50.times do
    String usernameS = Faker::Name.unique.first_name
    User.create(
        username: usernameS,
        name: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        score: Faker::Number.between(1, 10),
        talk_to_us: Faker::HarryPotter.quote
    )
end

20.times do
    Fragment.create(
    idfragment: Faker::Number.unique.number(5),
    title: Faker::Food.ingredient,
    introduction: Faker::Food.description,
    content: Faker::Food.description,
    source: Faker::Internet.url,
    score: Faker::Number.between(1, 10)
    )
end

20.times do
    Topic.create(
        idtopic: Faker::Number.unique.number(5),
        name: Faker::Simpsons.quote,
        score: Faker::Number.between(1, 100)
    )
end

10.times do
    SubTopic.create(
        idsub_topic: Faker::Number.unique.number(5),
        name: Faker::Simpsons.quote
    )
end
10.times do
    idcommentS = Faker::Number.unique.number(5)
    Comment.create(
        idcomment: idcommentS,
        message: Faker::HarryPotter.quote,
        fragment_idfragment: Faker::Number.unique.number(5)
    )
    10.times do
        Response.create(
            idresponse: Faker::Number.unique.number(5),
            date: Faker::Date.backward(14),
            message: Faker::HarryPotter.quote,
            comment_idcoment: idcommentS,
            user_username: Faker::Name.unique.first_name
        )
    end
end