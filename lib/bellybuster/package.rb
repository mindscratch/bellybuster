module BellyBuster
  class Package < Hash

    def initialize
      super
      self[:content] = nil
      self[:type] = 'rb'
    end


  end
end