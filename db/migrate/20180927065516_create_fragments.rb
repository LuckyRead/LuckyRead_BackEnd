class CreateFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments, id:false do |t|
      t.integer :idfragment, primary_key: true, :null => false
      t.text :title, :null => false
      t.text :introduction
      t.text :content, :null => false
      t.text :source
      t.integer :score

      t.timestamps
    end
  end
end
