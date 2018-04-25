require "ansi/progressbar"

module PbSyringe
  class AnsiProgressbarUnit < ProgressUnit
    attr_reader :progressbar
    def start(**options)
      $stdout.sync = true
      $stderr.sync = true
      @progressbar = ANSI::Progressbar.new(options[:label], options[:total])
    end

    def increment(count)
      @progressbar.inc(count) if @progressbar
    end

    def finish
      @progressbar.finish if @progressbar
      @progressbar = nil
      $stderr.sync = false
      $stdout.sync = false
    end
  end
end
