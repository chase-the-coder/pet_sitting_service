FactoryBot.define do
  factory :booking do
    user { nil }
    animal { nil }
    hours_requested { 1 }
    date_of_service { "2024-01-25" }
    total_cost { "9.99" }
  end
end
