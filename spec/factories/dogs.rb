FactoryBot.define do
  factory :dog do
    title         { '綺麗な毛色の可愛い子です!' }
    dog_gender    {1}
    dog_age_id    {2}
    vaccine       {2}
    surgery       {2}
    prefecture_id {2}
    feature       { '普段は大人しいですが、散歩に行く時はすごく喜びます!' }
    reason        { '行政処分センターより保護しました。' }
    remarks       { 'ご家族全員が賛成して迎えてくださる方' }

    association :user

    after(:build) do |dog|
      dog.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
