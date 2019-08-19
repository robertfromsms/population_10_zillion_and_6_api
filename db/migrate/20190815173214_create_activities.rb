class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :description
      t.decimal :accessibility
      t.string :category
      t.integer :participants
      t.decimal :price
      t.integer :apiKey

      t.timestamps
    end
  end
end
