module BellyBuster
  module Package
    # A lightweight message that contains a package to be distributed.
    class Message

      attr_reader :content, :class_name, :package_type

      # Create a new message
      #
      # @param [*] content  the content of the package (string, object, bytes, etc), anything that can be marshalled
      # @param [String] class_name  the full name of the class being packaged (e.g. Foo::Bar::Baz)
      # @param [Class] package_type the package type, must be a subclass of BellyBuster::Package::Base
      def initialize(content, class_name, package_type=BellyBuster::Package::RubyClassPackage)
        raise ArgumentError, "initializer method must be defined" if class_name.nil?
        raise ArgumentError, "package type can not be nil" if package_type.nil?
        raise ArgumentError, "package type must be a class, type was #{package_type.class}" unless package_type.is_a?(Class)
        raise ArgumentError, "package type must be subclass of #{BellyBuster::Package::Base}" unless (package_type.superclass == BellyBuster::Package::Base)

        @content = content
        @class_name = class_name
        @package_type = package_type.name
      end
    end
  end
end