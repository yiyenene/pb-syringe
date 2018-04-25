class TestClass
  include PbSyringe::Progressable
end

RSpec.describe PbSyringe::Progressable do
  let(:stub_unit) { StubProgressUnit.new }
  let(:progressable) do
    TestClass.new.tap { |x| x.progress_unit = stub_unit }
  end

  describe "#progress_start" do
    it "called start method of unit" do
      opt = { test: "Test" }
      progressable.progress_start(**opt)
      expect(stub_unit.start_called).to eq(1)
      expect(stub_unit.start_options).to eq(opt)
    end
  end

  describe "#progress_increment" do
    it "called increment method of unit" do
      progressable.progress_increment(10)
      expect(stub_unit.current).to eq(10)
      expect(stub_unit.increment_called).to eq(1)
    end
  end

  describe "#progress_finish" do
    it "called finish method of unit" do
      progressable.progress_finish
      expect(stub_unit.finish_called).to eq(1)
    end
  end

  context "suppress? returns true" do
    before do
      allow(PbSyringe).to receive(:suppress?).and_return(true)
    end

    describe "#progress_start" do
      it "not called start method of unit" do
        opt = { test: "Test" }
        progressable.progress_start(**opt)
        expect(stub_unit.start_called).to eq(0)
        expect(stub_unit.start_options).to eq(nil)
      end
    end

    describe "#progress_increment" do
      it "not called increment method of unit" do
        progressable.progress_increment(10)
        expect(stub_unit.current).to eq(0)
        expect(stub_unit.increment_called).to eq(0)
      end
    end

    describe "#progress_finish" do
      it "not called finish method of unit" do
        progressable.progress_finish
        expect(stub_unit.finish_called).to eq(0)
      end
    end
  end
end
