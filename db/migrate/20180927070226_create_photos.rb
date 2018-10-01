class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos, id:false do |t|
      t.integer :idphoto, primary_key: true, :null => false
      t.text :path, :null => false
      t.string :user_username
      t.integer :fragment_idfragment

      t.timestamps
    end
  end
end
