# frozen_string_literal: true

#ServiceArea migration
class CreateServiceAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :service_areas do |t|
      t.references :ticket, null:false
      t.references :area_code, null: false
      t.string :type

      t.timestamps
    end
  end
end
