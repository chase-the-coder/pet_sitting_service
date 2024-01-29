FactoryBot.define do
  factory :booking do
    user { nil }
    animal { nil }
    hours_requested { 2 }
  end
end
