# frozen_string_literal: true

# ServiceArea migration
class CreateServiceAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :service_areas do |t|
      t.references :ticket, foreign_key: true
      t.references :area_code, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
