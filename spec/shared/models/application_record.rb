# frozen_string_literal: true

# ActiveRecord shared example
RSpec.shared_examples 'application record' do
  let(:factory_name) { described_class.name.underscore.to_sym }
  let(:subject) { build(factory_name) }

  it 'has a factory' do
    expect { subject }.not_to raise_error
  end

  context 'class methods' do
    it 'respond to name and its is not nil' do
      expect(described_class.respond_to?(:name)).to be_truthy
      expect(described_class.name).not_to be_nil
      expect(described_class.table_name).not_to be_nil
    end
  end
end
