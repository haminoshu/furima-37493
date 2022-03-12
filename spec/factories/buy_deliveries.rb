FactoryBot.define do
  factory :buy_delivery do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { '2' }
    municipality { 'キャンプテック市' }
    address { 'チームB' }
    phone_number { '1234567891' }
  end
end
