module BellyBuster
  module Package
    # A lightweight message that contains a package to be distributed.
    class Message

      attr_reader :content, :type

      # Create a new message
      #
      # @param [*] content  the content of the package (string, object, bytes, etc), anything that can be marshalled
      # @param [Class] type the package type, must be a subclass of BellyBuster::Package::Base
      def initialize(content, type=BellyBuster::Package::RubyClassPackage)
        raise ArgumentError, "package type can not be nil" if type.nil?
        raise ArgumentError, "package type must be a class, type was #{type.class}" unless type.is_a?(Class)
        raise ArgumentError, "package type must be subclass of #{BellyBuster::Package::Base}" unless (type.superclass == BellyBuster::Package::Base)

        @content = content
        @type = type.name
      end
    end
  end
end