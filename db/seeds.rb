URL_Fake = []
URL_Fake.push("https://i.imgur.com/AZbKzgd.png")
URL_Fake.push("https://i.imgur.com/Y6jYshC.png")
URL_Fake.push("https://i.imgur.com/j1akRyn.jpg")
URL_Fake.push("https://i.imgur.com/IDGL2Qm.jpg")
URL_Fake.push("https://i.imgur.com/HgldamX.jpg")
URL_Fake.push("https://i.imgur.com/KO5Pi92.jpg")
URL_Fake.push("https://i.imgur.com/itJBP7s.jpg")
URL_Fake.push("https://i.imgur.com/pEcle0Y.jpg")
URL_Fake.push("https://i.imgur.com/8cgJxrO.jpg")
URL_Fake.push("https://i.imgur.com/noAq1cd.jpg")
URL_Fake.push("https://i.imgur.com/K5ArZqt.jpg")
5.times do
    country = Country.create!(
        country_name: Faker::Nation.capital_city
    )
    3.times do
        @city = City.create!(
            city_name: Faker::Nation.capital_city,
            countries_id: country.id
        )

        2.times do
            topic = Topic.create!(
                topic_name: Faker::Simpsons.quote,
                score: Faker::Number.between(1, 100)
            )
            3.times do                
                photo = Photo.create!(
                    path: Faker::Internet.url
                )
                @photouser
                @photofragmen
                if photo.id%2==0
                    photo.user_id = photo.id
                    photo.save
                    @photouser = photo.id
                else
                    photo.fragment_id = photo.id
                    photo.save
                    @photofragmen = photo.id
                end
                user = User.create!(
                    username: Faker::Name.unique.first_name,
                    name: Faker::Name.first_name,
                    lastname: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password,
                    city_id: @city.id,
                    score: Faker::Number.between(1, 10),
                    talk_to_us: Faker::HarryPotter.quote,
                    photos_id: @photouser
                )
                user2 = User.create!(
                    username: Faker::Name.unique.first_name,
                    name: Faker::Name.first_name,
                    lastname: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password,
                    city_id: @city.id,
                    score: Faker::Number.between(1, 10),
                    talk_to_us: Faker::HarryPotter.quote
                )

                Friend.create!(
                    follower: user.id,
                    followed: user2.id
                )

                3.times do
                    subtopic = SubTopic.create!(
                        sub_topic_name: Faker::Simpsons.quote
                    )

                    reltopic = RelTopicSubTopic.create!(
                        topics_id: topic.id,
                        sub_topics_id: subtopic.id
                    )
                    
                    SubTopicsTopic.create!(
                        topic_id: topic.id,
                        sub_topic_id: subtopic.id
                    )

                    SubTopicsUser.create!(
                        user_id: user.id,
                        sub_topic_id: subtopic.id,
                        score: Faker::Number.between(1, 10)
                    )

                    Preference.create!(
                        user_id: user.id,
                        sub_topic_id: subtopic.id,
                        score: Faker::Number.between(1, 10)
                    )

                    fragment = Fragment.create!(
                        title: Faker::Food.ingredient,
                        introduction: Faker::Food.description,
                        content: Faker::Food.description,
                        source: Faker::Internet.url,
                        score: Faker::Number.between(1, 10),
                        users_id: user.id,
                        photos_id: @photofragmen
                    )
                
                    Reaction.create!(
                        users_id: user.id,
                        fragments_id: fragment.id,
                        reaction: Faker::Zelda.character
                    )

                    comment = Comment.create!(
                        message: Faker::HarryPotter.quote,
                        datetime: Faker::Date.backward(14),
                        user_id: user.id,
                        fragment_id: fragment.id
                    )
                    RelFragmentSubTopic.create!(
                        fragments_id: fragment.id,
                        sub_topics_id: subtopic.id
                    )

                    FragmentsSubTopic.create!(
                        fragment_id: fragment.id,
                        sub_topic_id: subtopic.id
                    )
                    
                    response = Response.create!(
                        message: Faker::HarryPotter.quote,
                        datetime: Faker::Date.backward(14),
                        comments_id: comment.id,
                        users_id: user.id
                    )
                end                
            end         
        end
    end
end