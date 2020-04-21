# frozen_string_literal: true

# ContractForm::ServiceAreaForm factory
FactoryBot.define do
  factory :service_area_form, class: 'ContractForm::ServiceAreaForm' do
    primary_service_area_code { { sa_code: Faker::Code.asin } }
    additional_service_area_codes { { sa_code: 3.times.collect { Faker::Code.asin } } }
  end
end

