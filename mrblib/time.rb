class Time
  def self.now
    Time.new(*Platform::System.get_time)
  end

  def hwclock(offset = nil)
    if offset
      if offset.include? "+"
        timezone = offset.sub("+", "-")
      elsif offset.include? "-"
        timezone = offset.sub("-", "+")
      end
    end
    Platform::System.hwclock(self.year, self.month, self.day, self.hour, self.min, self.sec, timezone)
  end
end

