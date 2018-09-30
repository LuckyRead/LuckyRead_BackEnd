class AddFkToCityCountry < ActiveRecord::Migration[5.2]
  def change
    add_column :city_has_country, :id_city_has_country, :string, :null => false, primary_key: true
    add_column :comments, :user_iduser, :string, :null => false
    add_column :preference, :id_preference, :string, :null => false, primary_key: true
    add_column :rel_topic_subtopic, :id_rel_topic_subtopic, :string, :null => false, primary_key: true
    change_column :cities, :id_city, :bigint
    change_column :countries, :id_country, :bigint
    change_column :preference, :user_id, :string, :null => false
    change_column :subtopics, :id_subtopic, :bigint, :null => false
    change_column :comments, :fragment_idfragment, :bigint, :null => false
    add_column :fragments, :user_iduser, :string, :null => false
    change_column :photos, :fragment_idfragment, :bigint, :full => false
    change_column :reaction_user_fragment, :user_id, :string, :null => false
    change_column :topics, :idtopic, :bigint, :null => false
    add_column :friend, :id_fiend, :string, :null => false
    add_column :reaction_user_fragment, :id_reaction, :string, :null => false
    change_column :responses, :user_username, :string, :null => false
  end
end
