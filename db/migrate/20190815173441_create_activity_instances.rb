class CreateActivityInstances < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_instances do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true
      t.decimal :rating
      t.boolean :completed

      t.timestamps
    end
  end
end
