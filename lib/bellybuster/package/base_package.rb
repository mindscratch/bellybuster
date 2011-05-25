module BellyBuster
  module Package
    class Base < Hash
      extend BellyBuster::Package::Utils

      def initialize(opts={})
        super()
        self.merge!(opts)
      end

      # Install the package
      #
      # @return [Boolean] true if it was installed, false if it was not.
      def install
        raise "Classes inheriting from #{self.class.name} must implement the `install` method"
      end

      # Uninstall the package
      #
      # @return [Boolean] true if it was uninstalled, false if it was not.
      def uninstall
        raise "Classes inheriting from #{self.class.name} must implement the `uninstall` method"
      end

    end
  end
end