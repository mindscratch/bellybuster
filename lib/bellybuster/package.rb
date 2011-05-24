module BellyBuster
  class Package < Hash

    def initialize(file, opts={})
      raise "opts[:class] must be defined" if opts[:class].nil? or opts[:class].empty?

      super()
      self[:content] = load file
      self[:type] = 'rb'
      self.merge!(opts)
    end

    def class
      self[:class]
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