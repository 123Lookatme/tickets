# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContractForm::DateTimesForm, type: :form do
  include_examples 'application form'
  let(:params) { { response_due_date_time: response_due_date_time } }

  context 'empty params' do
    it { should_not be_valid }
  end

  context 'invalid params' do
    let(:response_due_date_time) { DateTime.yesterday }

    it { should_not be_valid }
  end

  context 'valid_params' do
    let(:response_due_date_time) { DateTime.tomorrow }

    it { should be_valid }
  end
end