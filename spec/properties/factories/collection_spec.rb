require './spec/spec_helper'

RSpec.describe Properties::Factories::Collection do
  let(:collection_factory) { described_class.new }

  describe "#build" do
    subject { collection_factory.build(property_records) }
    let(:property_record) { create(:property_record) }
    let(:property_records) { [property_record] }

    it { expect { subject }.to_not raise_error }
    it { expect(subject).to be_a(Properties::Collection) }
    it { expect(subject).to respond_to(:to_h) }
    it { expect(subject).to respond_to(:size) }
    it { expect(subject).to respond_to(:map) }
    it { expect(subject).to respond_to(:items) }
  end
end