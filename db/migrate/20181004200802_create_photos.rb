class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image
      t.text :base64_image
      t.timestamps
    end
    change_column :photos, :base64_image, :text, :limit => 1.gigabyte - 1
  end
end
