class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.string :cover_image
      t.integer :order_listed

      t.timestamps
    end
  end
end
