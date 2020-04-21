# frozen_string_literal: true

# ContractForm::DigsiteInfoForm factory
FactoryBot.define do
  factory :digsite_info_form, class: 'ContractForm::DigsiteInfoForm' do
    well_known_text do
      points = 10.times.collect { "#{Faker::Address.latitude} #{Faker::Address.longitude}" }
      "POLYGON((#{points.join(',')}))"
    end
  end
end

