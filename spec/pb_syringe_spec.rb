RSpec.describe PbSyringe do
  it "has a version number" do
    expect(PbSyringe::VERSION).not_to be nil
  end

  describe ".suppress?" do
    subject { PbSyringe.suppress? }
    it "by default, returns false" do
      is_expected.to eq(false)
    end

    it "effects suppress_if with value" do
      PbSyringe.suppress_if(true)
      is_expected.to eq(true)
    end

    it "effects suppress_if with block" do
      PbSyringe.suppress_if { true }
      is_expected.to eq(true)
    end

    it "block don't have result cache" do
      i = 0
      PbSyringe.suppress_if { i == 0 }
      is_expected.to eq(true)
      i = 1
      expect(PbSyringe.suppress?).to eq(false)
    end

    it "primary effects block than value" do
      PbSyringe.suppress_if(true) { false }
      is_expected.to eq(false)
    end
  end
end
