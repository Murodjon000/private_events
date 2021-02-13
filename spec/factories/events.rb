FactoryBot.define do
  factory :event, aliases: %i[attended_event] do
    creator
    name { 'hello world' }
    date { Time.zone.now }
    description { 'hello world description' }
  
    trait :past do
      date { Time.zone.now - 70.hours }
    end

    trait :upcoming do
      date { Time.zone.now + 20.hours }
    end
  end
end