module BellyBuster
  class PackageHandler

    def unpack
      puts "#{self.class}#unpack"
    end

    # Installs the package
    #
    # @param [BellyBuster::Package] the package to install
    # @return [Boolean] true if the package is installed successfully, false otherwise
    def install(package)
      puts "#{self.class}#install"

      # TODO Object.module_eval if it's a module, also handle gem
      Object.class_eval package[:content]
      klass = Object.const_get(package.class)
      klass.respond_to?(:new)
    end

    def uninstall(package)
      Object.send(:remove_const, package.class)
    end


  end
end