class CreateActivehashes < ActiveRecord::Migration[6.0]
  def change
    create_table :activehashes do |t|
      t.string     :category                   , null: false
      t.string     :status                     , null: false
      t.string     :shipping_fee_burden        , null: false
      t.string     :prefecture                 , null: false
      t.string     :delivery_day               , null: false
      t.integer    :item_id                    , null: false

      t.timestamps
    end
  end
end
