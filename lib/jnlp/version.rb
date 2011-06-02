module Jnlp #:nodoc:
  module VERSION
    MAJOR = 0
    MINOR = 7
    TINY  = 0

    STRING = [MAJOR, MINOR, TINY].join('.')
  
    class << self
      def to_s
        STRING
      end
    
      def ==(arg)
        STRING == arg
      end
    end
  end
end
