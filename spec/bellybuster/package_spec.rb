require File.expand_path("../../spec_helper", __FILE__)

module Foo
  module Bar
    class Baz
    end
  end
end

class MyPackage
  extend BellyBuster::Package::Utils
end

describe BellyBuster::Package::Utils do

  context "#class_defined?" do
    it "should return true" do
      MyPackage.class_defined?('Foo::Bar::Baz').should == true
    end

    it "should return false" do
      MyPackage.class_defined?('Foo::Thing').should == false
    end
  end

  context "#get_class_ref" do
    it "should return a reference to Foo::Bar::Baz" do
      klass = MyPackage.get_class_ref('Foo::Bar::Baz')
      klass.should_not be_nil
      klass.respond_to?(:new).should == true
    end

    it "should return nil for an invalid class name" do
      klass = MyPackage.get_class_ref('Foo::Thing')
      klass.should be_nil
    end
  end


end