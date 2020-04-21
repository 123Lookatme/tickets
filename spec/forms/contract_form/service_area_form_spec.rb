# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContractForm::ServiceAreaForm, type: :form do
  include_examples 'application form'
  let(:params) do
    {
      primary_service_area_code: primary_service_area_code,
      additional_service_area_codes: additional_service_area_codes
    }
  end

  context 'empty params' do
    it { should_not be_valid }
  end

  context 'with same code in primary and additional' do
    let(:code) { Faker::Code.asin }
    let(:primary_service_area_code) { { sa_code: code } }
    let(:additional_service_area_codes) { { sa_code: [code] } }

    it { should_not be_valid }
  end

  context 'with duplicated code in additional' do
    let(:code) { Faker::Code.asin }
    let(:primary_service_area_code) { { sa_code: Faker::Code.asin } }
    let(:additional_service_area_codes) { { sa_code: [code, code] } }

    it { should_not be_valid }
  end

  context 'valid codes' do
    let(:additional_codes) { 3.times.collect { Faker::Code.asin } }
    let(:primary_code) { Faker::Code.asin }
    let(:primary_service_area_code) { { sa_code: primary_code } }
    let(:additional_service_area_codes) { { sa_code: additional_codes } }

    it { should be_valid }
  end
end