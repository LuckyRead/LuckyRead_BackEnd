class CreateFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments, id:false do |t|
      t.bigint :idfragment, primary_key: true, :null => false
      t.string :title, :null => false
      t.string :introduction
      t.string :content, :null => false
      t.string :source
      t.integer :score, :default => 0

      t.timestamps
    end
  end
end
