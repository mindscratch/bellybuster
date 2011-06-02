require File.expand_path("../../spec_helper", __FILE__)


describe BellyBuster::PackageDistributer do
  it "should distribute the message" do
    exception_raised = false
    begin
      distributer = BellyBuster::PackageDistributer.new(nil)
      distributer.distribute File.join(File.dirname(__FILE__), '..', 'sample_rest_client.rb'), 'SampleRestClient'
    rescue Exception => ex
      puts "Problem distributing: #{ex.message}"
      puts ex.backtrace.join("\n")
      exception_raised = true
    end
    exception_raised.should_not == true
  end

#  require 'amqp'
#    EventMachine.run do
#      connection = AMQP.connect(:host => '127.0.0.1')
#      puts "Connected to AMQP broker. Running #{AMQP::VERSION} version of the gem..."
#
#      channel = AMQP::Channel.new(connection)
#      queue = channel.queue("amqpgem.examples.hello_world", :auto_delete => true)
#      exchange = channel.direct("")
#
#      queue.subscribe do |payload|
#        puts "Received a message: #{payload}. Disconnecting..."
#
#        handler = BellyBuster::PackageHandler.new
#        msg = handler.unpack payload
#        puts "Message: #{msg.inspect}"
#
#        #RETHINKTHIS :)...I messed up
#        installed = handler.install msg
#        puts "Package installed? #{installed}"
#
#        client = SampleRestClient.new
#        puts "URL from SampleRestClient: #{client.url}"
#
#        connection.close {
#          EM.stop { exit }
#        }
#      end
#
#      payload = Marshal.dump message
#      exchange.publish payload, :routing_key => queue.name
#    end

end