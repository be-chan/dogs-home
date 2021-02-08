FactoryBot.define do
  factory :user do
    nickname               { 'わんこ大好き太郎' }
    email                  { 'hoge@hoge.com' }
    password               { '1234567a' }
    password_confirmation  { password }
    full_name              { '鈴木 一郎' }
    full_name_kana         { 'スズキ イチロウ' }
    postal_code            { '123-4567' }
    prefecture_id          { 2 }
    city                   { '名古屋市中区' }
    address                { '栄3-1' }
    building_name          { 'オアシスビル501' }
    phone_number           { '09099999999' }
    job_id                 { 2 }
    age_id                 { 2 }
    gender_id              { 2 }
  end
end
