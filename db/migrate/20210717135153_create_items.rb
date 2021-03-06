class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,              null: false
      t.text :description,          null: false
      t.integer :item_status_id,    null: false
      t.integer :delivery_cover_id, null: false
      t.integer :ship_area_id,      null: false
      t.integer :ship_day_id,       null: false
      t.integer :category_id,       null: false
      t.integer :money,             null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
