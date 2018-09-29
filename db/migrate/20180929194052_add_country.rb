class AddCountry < ActiveRecord::Migration[5.2]
  def change
    create_table :country, id: false do |t|
      t.integer :id_country, primary_key: true
      t.string :country_name

      t.timestamps
    end
  end
end
