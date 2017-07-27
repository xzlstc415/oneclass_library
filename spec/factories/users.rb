require 'faker'

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@gamil.com"
    end
    password '123123123'
  end
end
