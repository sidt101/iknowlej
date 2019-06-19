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
    permission_type { :student }

    trait :admin do
      permission_type { :admin }
    end
  end
end

