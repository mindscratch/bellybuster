module BellyBuster
  module Transport
    class BaseSender
      def send(message)
        raise "Classes inheriting from #{self.class.name} must implement the `send` method"
      end
    end
  end
end