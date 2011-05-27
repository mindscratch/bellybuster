module BellyBuster
  module Package
    autoload :Message, 'bellybuster/package/message'
    autoload :Base, 'bellybuster/package/base_package'
    autoload :RubyClassPackage, 'bellybuster/package/ruby_class_package'

    module Utils
      def self.get_class_ref(class_name)
        klass = Kernel
        class_name.split("::").each do |name|
          if klass.const_defined? name
            klass = klass.const_get(name)
          else
            return nil
          end
        end
        klass
      end

      # Get the Class based on the given +class_name+
      #
      # @param [String] class_name the fully qualified name of the class
      # @return [Class] the reference to the class or nil if it could not be found
      def get_class_ref(class_name)
        klass = Kernel
        class_name.split("::").each do |name|
          if klass.const_defined? name
            klass = klass.const_get(name)
          else
            return nil
          end
        end
        klass
      end

      def class_defined?(class_name)
        return true unless self.get_class_ref(class_name).nil?
        false
      end
    end
  end
end