class CreateLikeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :like_comments do |t|
      t.references :comments, foreign_key: true, :null => false
      t.references :users, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
