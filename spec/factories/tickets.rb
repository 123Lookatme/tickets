# frozen_string_literal: true

# Ticket factory
FactoryBot.define do
  factory :ticket do
    request_number { "#{Faker::Number.number(digits: 7)}-#{Faker::Number.number(digits: 5)}" }
    sequence_number { Faker::Number.rand(100) }
    request_type { 'Normal' }
    response_due_date_time { Faker::Time.forward(days: 1) }
    well_known_text do
      points = 10.times.collect { "#{Faker::Address.latitude} #{Faker::Address.longitude}" }
      "POLYGON((#{points.join(',')}))"
    end
  end
end

# == Schema Information
#
# Table name: tickets
#
#  id                     :bigint           not null, primary key
#  request_number         :string
#  request_type           :integer          default("Normal")
#  response_due_date_time :datetime
#  sequence_number        :integer
#  well_known_text        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_tickets_on_request_number  (request_number) UNIQUE
#
