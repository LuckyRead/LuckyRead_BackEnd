class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name, :null => false
      t.bigint :countries_id, :null => false
      t.timestamps
    end
  end
end
