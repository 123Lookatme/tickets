# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AreaCode, type: :model do
  it_should_behave_like 'application record'

  describe 'validations' do
    it { should validate_presence_of(:sa_code) }
    it { should validate_uniqueness_of(:sa_code) }
  end
end
