require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe String do
  describe "super_range?" do
    expectations = {
      true => [ '1-', '1+', '1-2', '-2', '+2' ],
      false => [ '1' ]
    }
    expectations.each do |result, inputs|
      inputs.each do |input|
        it "should return #{result} for #{input}" do
          input.super_range?.should == result
        end
      end
    end
  end
  
  describe "to_super_range" do
    expectations = {
      '1-2' => [1, 2],
      '1-' => [1, nil],
      '-1' => [nil, 1]
    }
    expectations.each do |input, output|
      it "should convert #{input} into #{output.first}..#{output.last}" do
        sr = input.to_super_range(:to_i)
        sr.start.should == output.first
        sr.end.should == output.last
      end
    end
  end
end