require './spec/spec_helper'

RSpec.describe Properties::Services::Search do
  include Dry::Monads::Result::Mixin

  let(:service) { described_class.new }

  describe "#call" do
    subject { service.call(params: params) }
    let!(:property_record) { create(:property_record) }

    context "when results empty" do
      let(:params) do
        {
          property_type: "apartment",
          marketing_type: "rent",
          lng: 0.0,
          lat: 0.0
        }
      end

      let(:result) { subject.failure[:result] }
      let(:errors) { subject.failure[:errors] }

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Dry::Monads::Result::Failure) }
      it { expect(result).to eq([]) }
      it { expect(errors[:result]).to eq(["No data for requested params: #{params.to_json}"]) }
    end

    context "when results not empty" do
      let(:params) do
        {
          property_type: property_record.property_type,
          marketing_type: property_record.offer_type,
          lat: property_record.lat,
          lng: property_record.lng
        }
      end

      let(:result) { subject.success[:result] }
      let(:errors) { subject.success[:errors] }

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Dry::Monads::Result::Success) }
      it { expect(result.size).to eq(1) }
      it { expect(errors).to be_nil }
    end
  end
end
