# frozen_string_literal: true

# ActiveRecord shared example
RSpec.shared_examples 'STI model' do
  it_behaves_like 'application record'

  it { should have_attribute(:type) }
  it { should be_kind_of described_class }
end