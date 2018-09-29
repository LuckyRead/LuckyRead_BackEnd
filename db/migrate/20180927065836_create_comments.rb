class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id:false do |t|
      t.integer :idcomment, primary_key: true
      t.text :message
      t.integer :fragment_idfragment

      t.timestamps
    end
  end
end
