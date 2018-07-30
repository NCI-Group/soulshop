class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.string :Designation
      t.text :Description
      t.string :Freshness
      t.string :image_url
      t.string :Karma_Rating
      t.integer :Cost

      t.timestamps
    end
  end
end
