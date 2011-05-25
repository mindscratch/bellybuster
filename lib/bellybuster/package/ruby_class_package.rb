module BellyBuster
  module Package
    class RubyClassPackage < BellyBuster::Package::Base

      # Create a new package that contains a single Ruby class.
      #
      # @param [String] file the path to the ruby file to load (for transporting)
      # @param [Hash] opts
      #       :class [String] the fully qualified class name of the file being packaged
      def initialize(file, opts={})
        raise "opts[:class] must be defined" if opts[:class].nil? or opts[:class].empty?

        self[:content] = load file
        self[:type] = 'rb'

        super(opts)
      end

      def install
        # TODO Object.module_eval if it's a module, also handle gem
        Object.class_eval self[:content]
        klass = RubyClassPackage.get_class_ref self[:class]
        klass.respond_to?(:new)
      end

      def uninstall
        Object.send(:remove_const, self[:class])
        return true unless RubyClassPackage.class_defined?(self[:class]).nil?
        false
      end

      #######
      private
      #######

      def load(file)
        File.open(file, 'rb') do |io|
          io.read
        end
      end

    end
  end
end