# frozen_string_literal: true

RSpec.describe Kokki::CLI, :vcr do
  subject { Kokki::CLI }

  describe ".start" do
    context "when given a valid input" do
      it "returns a country flag of a given country" do
        output = capture(:stdout) { subject.start "JP" }
        expect(output).to eq("🇯🇵")
      end
    end

    context "when given an invalid input" do
      it "returns a country flag of a given country" do
        output = capture(:stdout) { subject.start "hoge" }.chomp
        expect(output).to eq("invalid input: hoge")
      end
    end
  end
end
