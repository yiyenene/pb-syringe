module PbSyringe
  class ProgressUnit
    def start(**_options)
      raise 'not implemented start'
    end

    def increment(_count)
      raise 'not implemented increment'
    end

    def finish
      raise 'not implemented finish'
    end
  end
end
