class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message, :null => false
      t.datetime :datetime, :null => false
      t.references :users, foreign_key: true, :null => false
      t.references :fragments, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
