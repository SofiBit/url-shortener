FactoryBot.define do
  factory :link do
    source_link { "https://upyachka.ru/" }
    short_url  { "57e4adf1" }
  end

  factory :link_invalid do
    source_link { "test" }
    short_url  { "57e4adf1" }
  end
end
