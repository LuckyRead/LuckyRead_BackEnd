class CreateFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments do |t|
      t.string :title, :null => false
      t.text :introduction, :null => false
      t.text :content, :null => false
      t.integer :score
      t.string :source, :null => false
      t.references :users, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
