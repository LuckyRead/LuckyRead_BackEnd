class AddCityHasCountry < ActiveRecord::Migration[5.2]
  def change
    create_join_table :city, :country, table_name: :city_has_country
  end
end
