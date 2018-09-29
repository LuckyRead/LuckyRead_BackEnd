class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id:false do |t|
      t.integer :idcomment, primary_key: true, :null => false
      t.text :message, :null => false
      t.integer :fragment_idfragment, :null => false

      t.timestamps
    end
  end
end
