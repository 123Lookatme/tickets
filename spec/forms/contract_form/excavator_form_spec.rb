# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContractForm::ExcavatorForm, type: :form do
  include_examples 'application form'
  let(:params) do
    {
      company_name: company_name,
      address: address,
      city: city,
      state: state,
      zip: zip,
      crew_onsite: crew_onsite
    }
  end

  it { should respond_to :full_address }

  context 'empty params' do
    it { should_not be_valid }

    # errors messages check goes here
  end

  context 'valid_params' do
    let(:company_name) { Faker::Company.name }
    let(:address) { Faker::Address.street_address }
    let(:city) { Faker::Address.city }
    let(:state) { Faker::Address.state }
    let(:zip) { Faker::Address.zip }
    let(:crew_onsite) { false }

    it { should be_valid }
  end
end