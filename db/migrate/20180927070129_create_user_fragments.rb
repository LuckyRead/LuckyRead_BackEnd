class CreateUserFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fragments, id:false do |t|
      t.integer :iduserfragment, primary_key: true
      t.text :title
      t.text :introduction
      t.text :content
      t.text :source
      t.integer :score
      t.text :state

      t.timestamps
    end
  end
end
