class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :path, :null => false
      #t.references :fragments, foreign_key: true, :null => true
      #t.references :users, foreign_key: true, :null => true
      t.timestamps
    end
  end
end
