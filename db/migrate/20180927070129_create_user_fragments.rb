class CreateUserFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fragments, id:false do |t|
      t.integer :iduserfragment, primary_key: true, :null => false
      t.text :title, :null => false
      t.text :introduction
      t.text :content, :null => false
      t.text :source
      t.integer :score, :default => 0
      t.text :state, :null => false

      t.timestamps
    end
  end
end
