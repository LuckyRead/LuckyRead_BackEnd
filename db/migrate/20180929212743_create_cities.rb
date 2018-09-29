class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities, id: false do |t|
      t.integer :id_city, primary_key: true, :null => false
      t.string :city_name, :null => false

      t.timestamps
    end
  end
end
