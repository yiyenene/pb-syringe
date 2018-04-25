require "pb_syringe/ansi_progressbar_unit"

RSpec.describe PbSyringe::AnsiProgressbarUnit do
  let(:unit) { PbSyringe::AnsiProgressbarUnit.new }
  let(:label) { "Test" }
  let(:total) { 100 }

  describe "#start" do
    it "called ANSI::ProgressBar.new with args" do
      expect(ANSI::Progressbar).to receive(:new).with(label, total)
      unit.start(label: label, total: total)
    end
  end

  describe "#increment" do
    let(:count) { 10 }
    it "called Progressbar.inc with args" do
      unit.start(label: label, total: total)
      expect(unit.progressbar).to receive(:inc).with(count)
      unit.increment(count)
    end
  end

  describe "#finish" do
    before do
      unit.start(label: label, total: total)
      allow(unit.progressbar).to receive(:show_progress)
    end

    it "called Progressbar.finish" do
      expect(unit.progressbar).to receive(:finish)
      unit.finish
    end

    it "progressbar set to nil" do
      progressbar = unit.progressbar
      expect { unit.finish }.to change { unit.progressbar }.from(progressbar).to(nil)
    end
  end
end
