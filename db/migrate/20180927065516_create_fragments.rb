class CreateFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments, id:false do |t|
      t.integer :idfragment, primary_key: true
      t.text :title
      t.text :introduction
      t.text :content
      t.text :source
      t.integer :score

      t.timestamps
    end
  end
end
