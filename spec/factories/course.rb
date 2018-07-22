FactoryBot.define do
  factory :course do
    name { 'Physics' }
  end

#   trait :with_documents do
#     course.documents.attach(File.new("#{Rails.root}/spec/tmp/storage/test.png"))
#   end
end
