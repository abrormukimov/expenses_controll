FactoryBot.define do
  factory :expense do
    name { 'testname' }
    amount { 500 }
    user_id { 1 }
  end
end
 