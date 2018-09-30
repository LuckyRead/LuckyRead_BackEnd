ALTER TABLE responses ADD FOREIGN KEY (comment_idcomment) REFERENCES comments(idcomment);
##ALTER TABLE city_has_country ADD FOREIGN KEY (city_id) REFERENCES cities(id_city);
##ALTER TABLE city_has_country ADD FOREIGN KEY (country_id) REFERENCES countries(id_country);
##ALTER TABLE friend ADD FOREIGN KEY (follower) REFERENCES users(username);
##ALTER TABLE friend ADD FOREIGN KEY (followed) REFERENCES users(username);
##ALTER TABLE users ADD FOREIGN KEY (Id_rel_country_city) REFERENCES city_has_country(id_city_has_country);
##ALTER TABLE photos ADD FOREIGN KEY (user_username) REFERENCES users(username);
##ALTER TABLE coments ADD FOREIGN KEY (user_iduser) REFERENCES users(username);
##ALTER TABLE reaction_user_fragment ADD FOREIGN KEY (fragment_id) REFERENCES fragments(idfragments);
##ALTER TABLE preference ADD FOREIGN KEY (user_id) REFERENCES users(username);
##ALTER TABLE preference ADD FOREIGN KEY (subtopic_id) REFERENCES subtopics(id_subtopic);
##ALTER TABLE comments ADD FOREIGN KEY (fragment_idfragment) REFERENCES fragments(idfragments);
##ALTER TABLE photos ADD FOREIGN KEY (comment_idcomment) REFERENCES fragments(idfragments);
##ALTER TABLE reaction_user_fragment ADD FOREIGN KEY (fragment_id) REFERENCES fragments(idfragments);
##ALTER TABLE reaction_user_fragment ADD FOREIGN KEY (user_id) REFERENCES users(username);
##ALTER TABLE rel_topic_subtopic ADD FOREIGN KEY (topic_id) REFERENCES topics(idtopic);
##ALTER TABLE rel_topic_subtopic ADD FOREIGN KEY (subtopic_id) REFERENCES subtopics(id_subtopic);
##