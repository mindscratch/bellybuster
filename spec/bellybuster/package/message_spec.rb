require File.expand_path("../../../spec_helper", __FILE__)

describe BellyBuster::Package::Message do

  context "a new, valid Message" do
    it "should have content" do
      message = BellyBuster::Package::Message.new("file contents", BellyBuster::Package::RubyClassPackage)
      message.content.should_not be_nil
    end

    it "should have a type" do
      message = BellyBuster::Package::Message.new("file contents", BellyBuster::Package::RubyClassPackage)
      message.type.should == BellyBuster::Package::RubyClassPackage.name
    end
  end

  context "create Message with invalid type" do
    it "should raise ArgumentError when type is nil" do
      expect {
        BellyBuster::Package::Message.new('some content', nil)
      }.to raise_error(ArgumentError)
    end

    it "should raise ArgumentError when type is not a Class" do
      expect {
        BellyBuster::Package::Message.new('some content', 5)
      }.to raise_error(ArgumentError)
    end

    it "should raise ArgumentError when type is not a subclass of BellyBuster::Package::Base" do
      expect {
        BellyBuster::Package::Message.new('some content', BellyBuster::Package)
      }.to raise_error(ArgumentError)
    end
  end


end