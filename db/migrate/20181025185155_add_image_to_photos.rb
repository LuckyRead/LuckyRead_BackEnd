class AddImageToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :image, :string
    add_column :photos, :base64_image, :text
  end
end
