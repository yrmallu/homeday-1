require './spec/spec_helper'

RSpec.describe Properties::Factories::Item do
  let(:item_factory) { described_class.new }

  describe "#build" do
    subject { item_factory.build(property_record) }
    let(:property_record) { create(:property_record) }

    it { expect { subject }.to_not raise_error }
    it { expect(subject).to be_a(Properties::Item) }
    it { expect(subject).to respond_to(:house_number) }
    it { expect(subject).to respond_to(:street) }
    it { expect(subject).to respond_to(:city) }
    it { expect(subject).to respond_to(:zip_code) }
    it { expect(subject).to respond_to(:lat) }
    it { expect(subject).to respond_to(:lng) }
    it { expect(subject).to respond_to(:price) }
  end
end