FactoryBot.define do
  factory :item do
    items_name { 'hoge' }
    items_price { 300 }
    explain { 'テスト説明' }
    category_id { '2' }
    status_id { '2' }
    shipping_fee_burden_id { '2' }
    prefecture_id { '2' }
    delivery_day_id { '2' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
