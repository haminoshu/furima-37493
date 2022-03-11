FactoryBot.define do
  factory :user do
    nickname { 'hoge' }
    email { Faker::Internet.free_email }
    password { 'hoge1104' }
    password_confirmation { 'hoge1104' }
    last_name { '苗字' }
    first_name { '名前' }
    last_name_ruby { 'ミョウジ' }
    first_name_ruby { 'ナマエ' }
    birthday { '1981-04-11' }
  end
end
