FactoryBot.define do
  factory :task do
    association :user
    sequence(:name) { |n| "Task #{n}" }
    description { "This is my task." }
    due_on { rand(1..30).days.from_now }
    completed { false }
  end
end
