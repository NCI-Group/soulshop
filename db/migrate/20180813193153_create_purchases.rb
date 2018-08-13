class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :user
      t.text :contents

      t.timestamps
    end
  end
end
