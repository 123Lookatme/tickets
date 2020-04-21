# frozen_string_literal: true

# ApplicationForm shared example
RSpec.shared_examples 'application form' do
  attributes = described_class.new.attributes
  attributes.keys.each do |attribute|
    let(attribute) { nil }
  end

  let(:subject) { described_class.new(params) }

  it { should respond_to(:submit!) }
  it { should respond_to(:validate!) }
  it { should respond_to(:attributes) }
end
