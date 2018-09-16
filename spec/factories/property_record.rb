FactoryBot.define do
  factory :property_record, class: Properties::Db::Record do
    offer_type { "rent" }
    property_type  { "apartment" }
    zip_code { "10119" }
    city { "Berlin" }
    street { "Choriner Straße" }
    house_number { 11 }
    lng { 13.407021 }
    lat { 52.5329014 }
    construction_year { 1997 }
    number_of_rooms { 3.0 }
    currency { "eur" }
    price { 350000.0 }
  end
end