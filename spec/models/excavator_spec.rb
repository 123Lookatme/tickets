# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Excavator, type: :model do
  it_should_behave_like 'application record'

  describe 'associations' do
    it { should belong_to(:ticket) }
  end

  describe 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:company_name) }
  end
end
