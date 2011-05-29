require File.expand_path("../../spec_helper", __FILE__)


describe BellyBuster::PackageDistributer do
  it "should distribute the message" do
    exception_raised = false
    begin
      distributer = BellyBuster::PackageDistributer.new
      distributer.distribute File.join(File.dirname(__FILE__), '..', 'sample_rest_client.rb'), 'SampleRestClient'
    rescue Exception => ex
      puts "Problem distributing: #{ex.message}"
      puts ex.backtrace.join("\n")
      exception_raised = true
    end
    exception_raised.should_not == true
  end
end