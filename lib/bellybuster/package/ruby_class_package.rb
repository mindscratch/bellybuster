module BellyBuster
  module Package
    class RubyClassPackage < BellyBuster::Package::Base

      # Create a new package that contains a single Ruby class.
      #
      # @param [String] package_content the content of the package (a ruby class, since this is the RubyClassPackage)
      # @param [String]
      # @param [Hash] opts
      #       :class [String] the fully qualified class name of the file being packaged
      def initialize(package_content, opts={})
        raise "opts[:class] must be defined" if opts[:class].nil? or opts[:class].empty?

        self[:content] = package_content

        super(opts)
      end

      def install
        # install the content
        Object.module_eval self[:content]

        klass = RubyClassPackage.get_class_ref self[:class]
        klass.respond_to?(:new)
      end

      def uninstall
        Object.send(:remove_const, self[:class])
        return true unless RubyClassPackage.class_defined?(self[:class]).nil?
        false
      end



    end
  end
end