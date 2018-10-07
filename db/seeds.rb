# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#[Subtopic, Topic, User, Fragment, Comment, Response, Photo, City, Country].each(&:delete_all)
=begin
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
    user.password = Faker::Internet.password
    user.score = Faker::Number.between(1, 10)
    user.talk_to_us = Faker::String.random
    Comment.populate 10..20 do |comment|
        comment.message = Faker::String.random
        Response.populate 10..100 do |response|
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
=end

10.times do
    id_countryS = Faker::Number.unique.number(5)
    Country.new(
        country_name: Faker::Nation.capital_city
    ).save
    id_cityS = Faker::Address.city
    City.new(
        city_name: id_cityS,
        countries_id: id_countryS
    ).save
    #id_city_has_country = id_cityS.to_s + "|" + id_countryS.to_s
    #SQL_Query = "INSERT INTO `LuckyRead_BackEnd_development`.`city_has_country` (`city_id`, `country_id`, `id_city_has_country`) VALUES ('" + id_cityS + "','" + id_countryS + "','" + id_city_has_country + "');"
    #ActiveRecord::Base.connection.execute(SQL_Query)
    5.times do
        idtopicS = Faker::Number.unique.number(5)
        Topic.new(
            topic_name: Faker::Simpsons.quote,
            score: Faker::Number.between(1, 100)
        ).save

        id_subtopicS = Faker::Number.unique.number(5)
        SubTopic.new(
            sub_topic_name: Faker::Simpsons.quote
        ).save

        #id_rel_topic_subtopic = idtopicS.to_s + "|" + id_subtopicS.to_s
        #SQL_Query = "INSERT INTO `LuckyRead_BackEnd_development`.`rel_topic_subtopic` (`topic_id`, `subtopic_id`,`id_rel_topic_subtopic`) VALUES ('" + idtopicS + "','" + id_subtopicS + "','" + id_rel_topic_subtopic + "');"
        #ActiveRecord::Base.connection.execute(SQL_Query)
        usernameS = Faker::Name.unique.first_name
        User.new(
            username: usernameS,
            name: Faker::Name.first_name,
            lastname: Faker::Name.last_name,
            email: Faker::Internet.email,
            password_digest: Faker::Internet.password,
            score: Faker::Number.between(1, 10),
            talk_to_us: Faker::HarryPotter.quote
            #Id_rel_country_city: id_city_has_country
        ).save

        usernameSTWO = Faker::Name.unique.first_name            
        Photo.new(
            path: Faker::Internet.url
        ).save

        User.new(
            username: usernameSTWO,
            name: Faker::Name.first_name,
            lastname: Faker::Name.last_name,
            email: Faker::Internet.email,
            password_digest: Faker::Internet.password,
            score: Faker::Number.between(1, 10),
            talk_to_us: Faker::HarryPotter.quote
            #Id_rel_country_city: id_city_has_country
        ).save
        #followed= usernameS
        #follower= usernameSTWO
        #id_fiend = followed.to_s + "|" + follower.to_s
        #SQL_Query = "INSERT INTO `LuckyRead_BackEnd_development`.`friend` (`followed`, `follower`,`id_fiend`) VALUES ('" + followed + "','" + follower + "','" + id_fiend + "');"
        #ActiveRecord::Base.connection.execute(SQL_Query)

        #id_preference = id_subtopicS.to_s + "|" + usernameS
        #SQL_Query = "INSERT INTO `LuckyRead_BackEnd_development`.`preference` (`subtopic_id`, `user_id`,`score`,`id_preference`) VALUES ('" + id_subtopicS + "','" + usernameS + "','" + (Faker::Number.between(1, 10)).to_s + "','" + id_preference + "');"
        #ActiveRecord::Base.connection.execute(SQL_Query)

        #idfragmentS = Faker::Number.unique.number(5)
        Fragment.new(
            #idfragment: idfragmentS,
            title: Faker::Food.ingredient,
            introduction: Faker::Food.description,
            content: Faker::Food.description,
            source: Faker::Internet.url,
            score: Faker::Number.between(1, 10)
            #user_iduser: usernameS
        ).save

        #id_reaction = usernameS + "|" + idfragmentS.to_s
        #SQL_Query = "INSERT INTO `LuckyRead_BackEnd_development`.`reaction_user_fragment` (`user_id`, `fragment_id`,`reaction`,`id_reaction`) VALUES ('" + usernameS + "','" + idfragmentS + "','" + (Faker::Food.ingredient).to_s + "','" + id_reaction + "');"
        #ActiveRecord::Base.connection.execute(SQL_Query)

        #idcommentS = Faker::Number.unique.number(5)
        Comment.new(
            #idcomment: idcommentS,
            message: Faker::HarryPotter.quote,
        ).save

        Response.new(
            message: Faker::HarryPotter.quote,
            datetime: Faker::Date.backward(14)
        ).save
            
        Photo.new(
            path: Faker::Internet.url
        ).save
    end
end