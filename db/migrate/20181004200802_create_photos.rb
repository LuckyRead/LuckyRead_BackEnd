class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :path, :null => false
      t.references :fragment#, foreign_key: true, :null => true
      t.references :user#, foreign_key: true, :null => true
      t.timestamps
    end
  end
end
