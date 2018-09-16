require './spec/spec_helper'

RSpec.describe Properties::Collection do
  let(:collection) { described_class.new(items) }
  let(:items) {}

  it { expect { collection }.to_not raise_error }

  describe "#to_h" do
    subject { collection.to_h }
    let(:items) do
      [
        {},
        {}
      ]
    end

    it { expect(subject).to eq([{}, {}]) }
  end

  describe "#size" do
    subject { collection.size }
    let(:items) do
      [
        {},
        {}
      ]
    end

    it { expect(subject).to eq(2) }
  end

  describe "#map" do
    subject { collection.map { |item| item[:value] *= 2 } }
    let(:items) do
      [
        { value: 1 },
        { value: 2 }
      ]
    end

    it { expect(subject).to eq([2, 4]) }
  end

  describe "#each" do
    subject { collection.each { |item| item[:value] *= 2 } }
    let(:items) do
      [
        { value: 1 },
        { value: 2 }
      ]
    end

    it { expect(subject).to eq([{ value: 2 }, { value: 4 }]) }
  end

  describe "#<<" do
    subject { collection << { value: 3 } }
    let(:items) do
      [
        { value: 1 },
        { value: 2 }
      ]
    end

    it { expect(subject).to eq([{ value: 1 }, { value: 2 }, { value: 3 }]) }
  end
end
