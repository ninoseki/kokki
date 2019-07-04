# frozen_string_literal: true

RSpec.describe Kokki::Converter, :vcr do
  subject { Kokki::Converter }

  describe ".convert" do
    context "when given an alpha-2-code" do
      it "returns a country flag of a given country" do
        flag = subject.convert("US")
        expect(flag).to eq("🇺🇸")

        flag = subject.convert("JP")
        expect(flag).to eq("🇯🇵")
      end
    end

    context "when given an alpha-3-code" do
      it "returns a country flag of a given country" do
        flag = subject.convert("USA")
        expect(flag).to eq("🇺🇸")

        flag = subject.convert("JPN")
        expect(flag).to eq("🇯🇵")
      end
    end

    context "when given a country name" do
      it "returns a country flag of a given country" do
        flag = subject.convert("United States")
        expect(flag).to eq("🇺🇸")

        flag = subject.convert("Japan")
        expect(flag).to eq("🇯🇵")
      end
    end

    context "when given an ip address" do
      it "returns a country flag of a given country" do
        flag = subject.convert("1.0.16.0")
        expect(flag).to eq("🇯🇵")
      end
    end

    context "when given an invalid input" do
      it "raises an InvalidError" do
        expect { subject.convert("test") }.to raise_error(Kokki::InvalidInputError)
        expect { subject.convert("zz") }.to raise_error(Kokki::InvalidInputError)
        expect { subject.convert("127.0.0.1") }.to raise_error(Kokki::InvalidInputError)
      end
    end
  end
end
