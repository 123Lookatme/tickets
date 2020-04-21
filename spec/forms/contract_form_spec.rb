# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContractForm, type: :form do
  include_examples 'application form'
  let(:params) { {} }

  context 'with empty params' do
    it { should_not be_valid }
  end

  context 'with valid params' do
    let(:params) do
      {
        excavator_attributes: attributes_for(:excavator_form),
        ticket_attributes: attributes_for(:ticket_form),
        service_area_attributes: attributes_for(:service_area_form),
        digsite_info_attributes: attributes_for(:digsite_info_form),
        date_times_attributes: attributes_for(:date_times_form)
      }
    end

    it { should be_valid }

    it 'should save models' do
      expect(subject.submit!).to be_truthy
      expect(subject.ticket_).to be_persisted
      expect(subject.excavator_).to be_persisted
      expect(subject.primary_service_area_).to be_persisted
      expect(subject.additional_service_areas_).to all(be_persisted)
    end
  end

end