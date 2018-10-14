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
                    @photouser = photo.id
                else
                    @photofragmen = photo.id
                end
                user = User.create!(
                    username: Faker::Name.unique.first_name,
                    name: Faker::Name.first_name,
                    lastname: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    password: Faker::Internet.password,
                    cities_id: @city.id,
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
                    cities_id: @city.id,
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

                    Preference.create!(
                        users_id: user.id,
                        sub_topics_id: subtopic.id,
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
                        users_id: user.id,
                        fragments_id: fragment.id
                    )
                    RelFragmentSubTopic.create!(
                    fragments_id: fragment.id,
                    sub_topics_id: subtopic.id
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