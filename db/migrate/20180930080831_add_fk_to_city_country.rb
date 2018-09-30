class AddFkToCityCountry < ActiveRecord::Migration[5.2]
  def change
    add_column :city_has_country, :id_city_has_country, :string, :null => false, primary_key: true
    add_column :comments, :user_iduser, :string, :null => false
    add_column :preference, :id_preference, :string, :null => false, primary_key: true
    add_column :rel_topic_subtopic, :id_rel_topic_subtopic, :string, :null => false, primary_key: true
    change_column :cities, :id_city, :bigint
    change_column :countries, :id_country, :bigint
  end
end
