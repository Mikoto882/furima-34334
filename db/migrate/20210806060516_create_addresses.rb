class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_number,   null: false
      t.integer    :ship_area_id,  null: false
      t.string     :address_city,  null: false
      t.string     :address_no,    null: false
      t.string     :address_build
      t.string     :tele_number,   null: false
      t.references :buy,           foreign_key: true
      t.timestamps
    end
  end
end
