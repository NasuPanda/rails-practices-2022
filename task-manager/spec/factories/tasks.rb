FactoryBot.define do
  factory :task do
    association :user
    sequence(:name) { |n| "Task #{n}" }
    description { "This is my task." }
    due_on { rand(1..30).days.from_now }
    completed { false }

    trait :invalid do
      name { 'a' * 51 }
      description { 'a' * 51 }
      due_on { nil }
      completed { nil }
    end
  end
end
