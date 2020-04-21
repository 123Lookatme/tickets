# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContractForm::TicketForm, type: :form do
  include_examples 'application form'
  let(:params) do
    {
      request_number: request_number,
      sequence_number: sequence_number,
      request_type: request_type
    }
  end

  context 'empty params' do
    it { should_not be_valid }
  end

  context 'invalid params' do
    let(:request_type) { 'invalid' }
    let(:sequence_number) { 0 }
    let(:request_number) { 'invalid' }

    it { should_not be_valid }
  end

  context 'not unique request_number' do
    let(:ticket) { create(:ticket) }

    let(:request_type) { 'Normal' }
    let(:sequence_number) { 1 }
    let(:request_number) { ticket.request_number }

    it { should_not be_valid }
  end

  context 'valid params' do
    let(:ticket) { build(:ticket) }
    let(:request_type) { 'Normal' }
    let(:sequence_number) { 1 }
    let(:request_number) { ticket.request_number }

    it { should be_valid }
  end
end