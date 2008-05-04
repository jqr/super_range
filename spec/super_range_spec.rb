require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe SuperRange do
  before(:each) do
    @sr = SuperRange.new
  end
  
  describe "after_start?" do
    def after_start?(value)
      @sr.send(:after_start?, value)
    end
    
    it "should be true when there is no start" do
      after_start?(1000).should == true
    end
    
    it "should be false when the value is before start" do
      @sr.start = 1
      after_start?(0).should == false
    end

    it "should be true when the value is start" do
      @sr.start = 1
      after_start?(1).should == true
    end

    it "should be true when the value is after start" do
      @sr.start = 1
      after_start?(2).should == true
    end
  end

  describe "before_end?" do
    def before_end?(value)
      @sr.send(:before_end?, value)
    end

    it "should be true when there is no end" do
      before_end?(1000).should == true
    end
    
    it "should be true when the value is before end" do
      @sr.end = 1
      before_end?(0).should == true
    end

    it "should be true when the value is end" do
      @sr.end = 1
      before_end?(1).should == true
    end

    it "should be false when the value is after end" do
      @sr.end = 1
      before_end?(2).should == false
    end
  end

  describe "include?" do
    it "should be false when it isn't after start" do
      @sr.stub!(:after_start?).and_return(false)
      @sr.stub!(:before_end?).and_return(true)
      @sr.include?(0).should be_false
    end

    it "should be true when it is after start but before end" do
      @sr.stub!(:after_start?).and_return(true)
      @sr.stub!(:before_end?).and_return(true)
      @sr.include?(0).should be_true
    end
    
    it "should be false when not before end" do
      @sr.stub!(:after_start?).and_return(true)
      @sr.stub!(:before_end?).and_return(false)
      @sr.include?(0).should be_false
    end
  end
  
  describe "to_s" do
    it "should return '...' for an open range" do
      @sr.to_s.should == '...'
    end

    it "should return 'X...' for an open ended range" do
      @sr.start = 'X'
      @sr.to_s.should == 'X...'
    end
    
    it "should return '...X' for an open started range" do
      @sr.end = 'X'
      @sr.to_s.should == '...X'
    end
    
    it "should return 'X..Y' for an enclosed range" do
      @sr.start = 'X'
      @sr.end = 'Y'
      @sr.to_s.should == 'X..Y'
    end
  end
  
  describe "inspect" do
    it "should be the same as to_s" do
      @sr.inspect.should == '...'
    end
  end
  
end
