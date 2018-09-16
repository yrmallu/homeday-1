class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :properties, [:offer_type, :property_type, :lng, :lat], using: :gist, name: "index_properties_on_offer_and_property_type_and_ll"
  end
end
