class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :order_listed
      t.integer :album_id

      t.timestamps
    end
  end
end
