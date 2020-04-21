# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContractForm::DigsiteInfoForm, type: :form do
  include_examples 'application form'
  let(:params) { { well_known_text: well_known_text } }

  context 'empty params' do
    it { should_not be_valid }
  end

  context 'valid_params' do
    let(:well_known_text) { 'some string' }

    it { should be_valid }
  end
end