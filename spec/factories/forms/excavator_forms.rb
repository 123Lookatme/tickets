# frozen_string_literal: true

# ContractForm::ExcavatorForm factory
FactoryBot.define do
  factory :excavator_form, class: 'ContractForm::ExcavatorForm' do
    company_name { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    crew_onsite { false }
  end
end
