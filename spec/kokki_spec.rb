# frozen_string_literal: true

RSpec.describe Kokki do
  subject { Kokki }

  it "has a version number" do
    expect(Kokki::VERSION).not_to be nil
  end

  describe ".flagize" do
    before do
      allow(Kokki::Converter).to receive(:convert)
    end

    it "should call Converter.convert" do
      Kokki.flagize "US"

      expect(Kokki::Converter).to have_received(:convert).once
    end
  end
end
