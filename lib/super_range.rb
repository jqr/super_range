require 'lib/extensions/string'

class SuperRange
  attr_accessor :start, :end
  
  def initialize(start = nil, ending = nil)
    self.start = start
    self.end = ending
  end
  
  def include?(value)
    after_start?(value) && before_end?(value)
  end

  def to_s
    if start
      if self.end
        "#{start}..#{self.end}"
      else
        "#{start}..."
      end
    else
      if self.end
        "...#{self.end}"
      else
        "..."
      end
    end
  end
  
  alias :inspect :to_s
  
  private

  def after_start?(value)
    !start || value >= start
  end
  
  def before_end?(value)
    !self.end || value <= self.end
  end
  
end