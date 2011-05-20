require File.expand_path("../spec_helper", __FILE__)

BellyBuster.describe "Package#to_hash" do
  should "provide a hash with any extra properties given" do
    package = BellyBuster::Package.new
    package[:version] = 1
    hash = package.to_hash
    hash[:version].should eq(1)
  end
end