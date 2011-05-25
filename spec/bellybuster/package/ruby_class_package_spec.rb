require File.expand_path("../../../spec_helper", __FILE__)

describe BellyBuster::Package::RubyClassPackage do

  let(:sample_file) {
    $sample_file = File.join(File.dirname(__FILE__), '../../sample_rest_client.rb')
  }

  it "should always have a content" do
    package = BellyBuster::Package::RubyClassPackage.new(sample_file, :class => 'SampleRestClient')
    package[:content].should_not be_nil
  end

  it "should always have a type" do
    package = BellyBuster::Package::RubyClassPackage.new(sample_file, :class => 'SampleRestClient')
    package[:type].should == 'rb'
  end

  it "should provide a hash with any extra properties given" do
    package = BellyBuster::Package::RubyClassPackage.new(sample_file, {:version => 1, :class => 'SampleRestClient'})
    hash = package.to_hash
    hash[:version].should == 1
  end


end