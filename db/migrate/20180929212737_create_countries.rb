class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries, id: false do |t|
      t.integer :id_country, primary_key: true, :null => false
      t.string :country_name, :null => false

      t.timestamps
    end
  end
end
