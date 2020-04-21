# frozen_string_literal: true

# Excavator migration
class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.boolean :crew_onsite, default: false
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
