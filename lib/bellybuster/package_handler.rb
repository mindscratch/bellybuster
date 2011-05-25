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
      package.install
    end

    def uninstall(package)
      package.uninstall
    end


  end
end