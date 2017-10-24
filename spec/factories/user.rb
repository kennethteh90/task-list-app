FactoryBot.define do
  factory:user do
    name "Name"
    password "123456"
    sequence :email { |n| "person#{n}@example.com" }
  end
end
