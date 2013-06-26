require 'rspec'
require 'main.rb'

describe '/' do 
	before do
    get '/' 
  end

  it "should greet me" do
    @name.should == "Ryan Waters"
  end
end