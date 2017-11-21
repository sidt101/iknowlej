FactoryBot.define do
  sequence :user_name do |i|
    "Susheel-#{i}"
  end

  sequence :email do |i|
    "susheel#{i}@susheel#{i}.com"
  end

  factory :user do
    name { generate(:user_name) }
    email{ generate(:email) }
  end
end

