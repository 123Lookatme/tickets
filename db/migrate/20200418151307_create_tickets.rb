# frozen_string_literal: true

# Tickets migration
class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.integer :sequence_number
      t.integer :request_type, default: 0
      t.datetime :response_due_date_time
      t.string :well_known_text

      t.timestamps
    end

    add_index :tickets, :request_number, unique: true
  end
end
