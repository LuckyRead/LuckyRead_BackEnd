class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :idphoto
      t.text :path
      t.text :user_username
      t.integer :fragment_idfragment

      t.timestamps
    end
  end
end
