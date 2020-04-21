# frozen_string_literal: true

# Excavator factory
FactoryBot.define do
  factory :excavator do
    company_name { Faker::Company.name }
    address { Faker::Address.full_address }
    crew_onsite { false }
    ticket
  end
end

# == Schema Information
#
# Table name: excavators
#
#  id           :bigint           not null, primary key
#  address      :string
#  company_name :string
#  crew_onsite  :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  ticket_id    :bigint           not null
#
# Indexes
#
#  index_excavators_on_ticket_id  (ticket_id)
#
