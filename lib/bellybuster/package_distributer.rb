require "amqp"

module BellyBuster
  class PackageDistributer

    def distribute(file_name, class_name, package_type=BellyBuster::Package::RubyClassPackage)
      message = BellyBuster::Package::Message.new load(file_name), class_name, package_type
      over_amqp message
    end

    #######
    private
    #######

    def over_amqp(message)
      EventMachine.run do
        connection = AMQP.connect(:host => '127.0.0.1')
        puts "Connected to AMQP broker. Running #{AMQP::VERSION} version of the gem..."

        channel = AMQP::Channel.new(connection)
        queue = channel.queue("amqpgem.examples.hello_world", :auto_delete => true)
        exchange = channel.direct("")

        queue.subscribe do |payload|
          puts "Received a message: #{payload}. Disconnecting..."

          handler = BellyBuster::PackageHandler.new
          msg = handler.unpack payload
          puts "Message: #{msg.inspect}"

          #RETHINKTHIS :)...I messed up
          installed = handler.install msg
          puts "Package installed? #{installed}"

          client = SampleRestClient.new
          puts "URL from SampleRestClient: #{client.url}"

          connection.close {
            EM.stop { exit }
          }
        end

        payload = Marshal.dump message
        exchange.publish payload, :routing_key => queue.name
      end
    end

    def load(file)
      File.open(file, 'rb') do |io|
        io.read
      end
    end

  end
end