class String
  ENDED_RANGE_INDICATORS = %w(-)
  OPEN_RANGE_INDICATORS = %w(- +)
  RANGE_INDICATORS = (ENDED_RANGE_INDICATORS + OPEN_RANGE_INDICATORS).uniq
  
  def to_super_range(converter = nil)
    raise "Not a Super Range" unless super_range?
    parts = self.split(/#{RANGE_INDICATORS.collect { |ri| Regexp.escape(ri) }.join('|')}/)
    if converter
      parts = parts.collect { |p| p.send(converter) unless p.empty? }
    end
    SuperRange.new(parts[0], parts[1])
  end
  
  def super_range?
    !!RANGE_INDICATORS.detect do |ri|
      include?(ri)
    end
  end
end