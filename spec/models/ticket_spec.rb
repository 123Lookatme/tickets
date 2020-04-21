# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:invalid_date) { 'invalid' }

  it_should_behave_like 'application record'
  it { should define_enum_for(:request_type).with_values('Normal' => 0) }

  describe 'associations' do
    it { should have_one(:excavator) }
    it { should have_one(:primary_service_area) }
    it { should have_many(:additional_service_areas) }
  end

  describe 'validations' do
    it { should validate_presence_of(:request_number) }
    it { should validate_presence_of(:sequence_number) }
    it { should validate_presence_of(:well_known_text) }
    it { should validate_presence_of(:response_due_date_time) }
    it { should_not allow_value(invalid_date).for(:response_due_date_time) }
    it { should allow_value(DateTime.current).for(:response_due_date_time) }
  end
end