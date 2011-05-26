module BellyBuster
  class PackageDistributer

    def distribute(file, package_type=BellyBuster::Package::RubyClassPackage)
      message = BellyBuster::Package::Message.new load(file), package_type
      puts "#{self.class.name}#distribute, message type = #{package_type}"
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