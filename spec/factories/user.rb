FactoryBot.define do
  sequence :user_name do |i|
    "Susheel-#{i}"
  end

  sequence :email do |i|
    "susheel#{i}@susheel#{i}.com"
  end

  sequence :password do |i|
    "susheel#{i}"
  end

  factory :user do
    name { generate(:user_name) }
    email{ generate(:email) }
    password { generate(:password) }
  end
end

