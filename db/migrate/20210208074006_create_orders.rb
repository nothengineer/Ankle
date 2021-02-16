class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user,             foreign_key: true
      t.references :movie,             foreign_key: true
      t.string       :postal_code,        null: false
      t.integer      :prefecture_id,      null: false
      t.string       :municipalities,     null: false
      t.string       :address,            null: false
      t.string       :building_name
      t.string       :phone_number,       null: false
      t.timestamps
    end
  end
end

