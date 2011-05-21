require File.expand_path("../spec_helper", __FILE__)

describe BellyBuster::Package do

  it "should always have a content" do
    package = BellyBuster::Package.new
    package[:content].should be_nil
  end

  it "should always have a type" do
    package = BellyBuster::Package.new
    package[:type].should == 'rb'
  end

  it "should provide a hash with any extra properties given" do
    package = BellyBuster::Package.new
    package[:version] = 1
    hash = package.to_hash
    hash[:version].should eq(1)
  end
end