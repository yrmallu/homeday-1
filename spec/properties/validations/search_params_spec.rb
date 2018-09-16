require './spec/spec_helper'

RSpec.describe Properties::Validators::SearchParams do
  let(:validator) { described_class }

  describe "#call" do
    subject { validator.call(params) }

    context "when params valid" do
      let(:params) do
        {
          property_type: "apartment",
          marketing_type: "rent",
          lng: 0.0,
          lat: 0.0
        }
      end

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Dry::Validation::Result) }
      it { expect(subject.output[:property_type]).to eq("apartment") }
      it { expect(subject.output[:marketing_type]).to eq("rent") }
      it { expect(subject.output[:lng]).to eq(0.0) }
      it { expect(subject.output[:lat]).to eq(0.0) }
      it { expect(subject.errors).to eq({}) }

      context "when lng and lat are strings" do
        context "when with numbers" do
          let(:params) do
            {
              lng: "10.0",
              lat: "-10.0"
            }
          end

          it { expect(subject.output[:lng]).to eq(10.0) }
          it { expect(subject.output[:lat]).to eq(-10.0) }
        end

        context "when with abstract data" do
          let(:params) do
            {
              lng: "abcd",
              lat: ""
            }
          end

          it { expect(subject.output[:lng]).to eq(0.0) }
          it { expect(subject.output[:lat]).to eq(0.0) }
        end
      end
    end

    context "when params invalid" do
      let(:params) do
        {
          property_type: "house",
          marketing_type: "subrent",
          lng: -100000.0,
          lat: +100000.0
        }
      end

      it { expect { subject }.to_not raise_error }
      it { expect(subject).to be_a(Dry::Validation::Result) }
      it { expect(subject.errors[:property_type]).to eq(["must be one of: apartment, single_family_house"]) }
      it { expect(subject.errors[:marketing_type]).to eq(["must be one of: rent, sell"]) }
      it { expect(subject.errors[:lng]).to eq(["must be greater than or equal to -180"]) }
      it { expect(subject.errors[:lat]).to eq(["must be less than or equal to 90"]) }
    end
  end
end
