FactoryBot.define do
  factory :user do
    username { 'test' }
    email { 'test@example.com' }
    password { '123456' }
  end
end
