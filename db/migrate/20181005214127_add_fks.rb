class AddFks < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :friends, :users, column: :follower
    add_foreign_key :friends, :users, column: :followed
    add_foreign_key :cities, :countries, column: :countries_id
    add_foreign_key :fragments, :photos, column: :photos_id
    add_foreign_key :users, :photos, column: :photos_id
  end
end
