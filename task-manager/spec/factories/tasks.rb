FactoryBot.define do
  factory :task do
    name { "MyText" }
    description { "MyText" }
    due_on { "2022-05-09 21:38:02" }
    complated { false }
  end
end
