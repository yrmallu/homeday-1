require './spec/spec_helper'

RSpec.describe Properties::Repositories::Property do
  let(:repository) { described_class.new }

  describe "#find_all" do
    subject { repository.find_all(params) }
    let!(:property_record) { create(:property_record) }

    context "when search results empty" do
      let(:params) do
        {
          property_type: "apartment",
          marketing_type: "sell",
          lat: 0.0,
          lng: 0.0
        }
      end

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Properties::Collection) }
      it { expect(subject.size).to be(0) }
    end

    context "when search results not empty" do
      let(:params) do
        {
          property_type: property_record.property_type,
          marketing_type: property_record.offer_type,
          lat: property_record.lat,
          lng: property_record.lng
        }
      end

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Properties::Collection) }
      it { expect(subject.size).to be(1) }
    end
  end
end
