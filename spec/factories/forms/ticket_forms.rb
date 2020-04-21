# frozen_string_literal: true

# ContractForm::TicketForm factory
FactoryBot.define do
  factory :ticket_form, class: 'ContractForm::TicketForm' do
    request_number { "#{Faker::Number.number(digits: 7)}-#{Faker::Number.number(digits: 5)}" }
    sequence_number { Faker::Number.rand(100) }
    request_type { 'Normal' }
  end
end
