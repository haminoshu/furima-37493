class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :items_name,               null: false
      t.integer   :items_price,              null: false
      t.text      :explain,                  null: false
      t.integer   :category_id,              null: false
      t.integer   :status_id,                null: false
      t.integer   :shipping_fee_burden_id,   null: false
      t.integer   :prefecture_id,            null: false
      t.integer   :delivery_day_id,          null: false
      t.references :user,                    null: false

      t.timestamps
    end
  end
end
