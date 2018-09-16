require './spec/spec_helper'

RSpec.describe Properties::Item do
  let(:item) { described_class.new(attributes) }
  let(:attributes) {}

  it { expect { item }.to_not raise_error }
end
