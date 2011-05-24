require File.expand_path("../spec_helper", __FILE__)

describe BellyBuster::PackageHandler do

  it "should install ruby package" do
    package = BellyBuster::Package.new(File.join(File.dirname(__FILE__), 'sample_rest_client.rb'), :class => 'SampleRestClient')

    handler = BellyBuster::PackageHandler.new
    result = handler.install package
    result.should == true

    handler.uninstall package

  end

end