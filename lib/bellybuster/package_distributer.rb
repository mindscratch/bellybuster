module BellyBuster
  class PackageDistributer

    # Create a new distributer and configure the sender to use
    #
    # @param [BellyBuster::Transport::Sender] sender  the sender responsible for sending messages
    def initialize(sender)
      raise ArgumentError, "sender can not be null" if sender.nil?
      raise ArgumentError, "sender must be of type #{BellyBuster::Transport::Sender.name} not #{sender}" unless sender.is_a?(BellyBuster::Transport::Sender)
      @sender = sender
    end

    def distribute(file_name, class_name, package_type=BellyBuster::Package::RubyClassPackage)
      message_contents = load file_name
      message = BellyBuster::Package::Message.new message_contents, class_name, package_type
      @sender.send message
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