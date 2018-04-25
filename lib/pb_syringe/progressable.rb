module PbSyringe
  module Progressable
    attr_accessor :progress_unit

    def progress_start(**options)
      return if PbSyringe.suppress?
      progress_unit.start(**options) if progress_unit
      return unless block_given?
      yield
      progress_finish
    end

    def progress_finish
      return if PbSyringe.suppress?
      progress_unit.finish if progress_unit
    end

    def progress_increment(count)
      return if PbSyringe.suppress?
      progress_unit.increment(count) if progress_unit
    end
  end
end
