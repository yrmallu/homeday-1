require './spec/spec_helper'

RSpec.describe Properties::Services::Validate do
  include Dry::Monads::Result::Mixin

  let(:service) { described_class.new }

  describe "#call" do
    subject { service.call(params: params) }

    context "when params valid" do
      let(:params) do
        {
          property_type: "apartment",
          marketing_type: "rent",
          lng: 0.0,
          lat: 0.0
        }
      end
      let(:validated_params) { subject.success[:validated_params] }
      let(:errors) { subject.success[:errors] }

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Dry::Monads::Result::Success) }
      it { expect(validated_params[:property_type]).to eq("apartment") }
      it { expect(validated_params[:marketing_type]).to eq("rent") }
      it { expect(validated_params[:lng]).to eq(0.0) }
      it { expect(validated_params[:lat]).to eq(0.0) }
      it { expect(errors).to be_nil }
    end

    context "when params invalid" do
      let(:params) do
        {
          property_type: "apartment",
          marketing_type: "subrent",
          lng: 0.0,
          lat: 0.0
        }
      end
      let(:validated_params) { subject.failure[:validated_params] }
      let(:errors) { subject.failure[:errors] }

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Dry::Monads::Result::Failure) }
      it { expect(validated_params[:property_type]).to eq("apartment") }
      it { expect(errors[:marketing_type]).to eq(["must be one of: rent, sell"]) }
      it { expect(validated_params[:lng]).to eq(0.0) }
      it { expect(validated_params[:lat]).to eq(0.0) }
    end
  end
end
