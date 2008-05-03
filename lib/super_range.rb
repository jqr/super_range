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
  
  private

  def after_start?(value)
    !start || value >= start
  end
  
  def before_end?(value)
    !self.end || value <= self.end
  end
end