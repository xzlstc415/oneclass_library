require 'faker'

FactoryGirl.define do
  factory :book do
    sequence :name do |n|
      "book#{n}"
    end
    sequence :isbn do |n|
      "123-123-123-123-#{n}"
    end
    quantity Faker::Number.number(2)
  end
end
