
module BellyBuster
  class PackageHandler

    # Unpack the message payload.
    #
    # @param [Object, String, bytes, ?] message_payload the contents of the message received over the wire
    # @return [BellyBuster::Package::Message] the message unpacked from +message_payload+
    def unpack(message_payload)
      # TODO make the unpacker (maybe need a different name for this) it's own thing that can be plugged in
      # this example uses Marshal.load ...which assumes Marshal.dump was used to send the message...but maybe it wasn't
      # either way, ultimately the thing that packages up the message to send and the thing that unpacks it should be
      # pluggable
      # In fact, this calss is the "package'handler, but it's dealing with a message. Smells bad to me...
      Marshal.load(message_payload)
    end

    # Installs the package
    #
    # @param [BellyBuster::Package::Mesage] the message that was sent which contains the package to install
    # @return [Boolean] true if the package is installed successfully, false otherwise
    def install(message)
      pkg_class = BellyBuster::Package::Utils.get_class_ref(message.package_type)
      pkg = pkg_class.new(message.content, :class => message.class_name)
      pkg.install
    end

    def uninstall(package)
      package.uninstall
    end

    #######
    private
    #######
    def extract_class(value)

    end

  end
end