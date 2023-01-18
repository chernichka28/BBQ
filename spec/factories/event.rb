FactoryBot.define do
  factory :event do
    title {"Party"}

    address {"Miami"}

    datetime {"Tue, 17 Jan 2023 17:24:00.000000000 UTC +00:00"}

    association :user
  end
end
