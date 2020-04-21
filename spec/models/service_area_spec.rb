# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceArea, type: :model do
  it_should_behave_like 'application record'

  describe 'associations' do
    it { should belong_to(:ticket) }
    it { should belong_to(:area_code) }
  end

  context 'Primary' do
    let(:subject) { build(:primary_service_area) }

    it_should_behave_like 'STI model'
  end

  context 'Additional' do
    let(:subject) { build(:additional_service_area) }

    it_should_behave_like 'STI model'
  end
end
