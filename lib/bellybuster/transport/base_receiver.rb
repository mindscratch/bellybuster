module BellyBuster
  module Transport
    # Defines an interface for an object responsible for receiving BellyBuster::Package::Message's
    class BaseReceiver
      # Receive a message
      #
      # @param [BellyBuster::Package::Message] message  the message
      def receive(message)
        raise "Classes inheriting from #{self.class.name} must implement the `receive` method"
      end
    end
  end
end