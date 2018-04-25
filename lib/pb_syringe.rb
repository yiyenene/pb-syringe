require "pb_syringe/version"
require "pb_syringe/progressable"
require "pb_syringe/progress_unit"

module PbSyringe
  class << self
    attr_reader :suppress, :suppress_proc

    def suppress?
      suppress_proc ? suppress_proc.call : suppress == true
    end

    def suppress_if(value = false, &block)
      @suppress_proc = block if block_given?
      @suppress = value
    end
  end
end
