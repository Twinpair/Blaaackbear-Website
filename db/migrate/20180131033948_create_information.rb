class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.string :title
      t.string :headline
      t.string :name
      t.text :about_me
      t.string :instagram
      t.string :twitter
      t.string :facebook
      t.string :linkedin
      t.string :banner_image
      t.string :about_image
      t.string :contact_image
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
