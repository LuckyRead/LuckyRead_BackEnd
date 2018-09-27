class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :idcomment
      t.text :message
      t.integer :fragment_idfragment

      t.timestamps
    end
  end
end
