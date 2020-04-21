# frozen_string_literal: true

# ContractForm::DateTimesForm factory
FactoryBot.define do
  factory :date_times_form, class: 'ContractForm::DateTimesForm' do
    response_due_date_time { Faker::Time.forward(days: 1) }
  end
end

