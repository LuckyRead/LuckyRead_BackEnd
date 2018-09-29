class AddIdRelCountryCityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Id_rel_country_city, :string, :null => false
  end
end
