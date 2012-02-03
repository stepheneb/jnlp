module Jnlp
  class J2se
    #
    # Contains the Hpricot element parsed from the orginal Jnlp
    # that was used to create the Property
    #
    attr_reader :j2se
    #
    # Contains the version of the J2SE element:
    #
    # Example:
    #
    #   "1.5+"
    #
    attr_reader :version
    #
    # Contains the max-heap-size specified in the J2SE element:
    #
    # Example:
    #
    #   "128m"
    #
    attr_reader :max_heap_size
    #
    # Contains the initial-heap-size specified in the J2SE element:
    #
    # Example:
    #
    #   "32m"
    #
    attr_reader :initial_heap_size
    #
    # Contains the value of the optional java-vm-args attribute in
    # in the J2SE element, the value is nil if not present:
    #
    # Example:
    #
    #   "-d32"
    #
    attr_reader :java_vm_args
    #
    # Contains the value of the os attribute in the
    # parent <resources> element that contains this property
    # if the attribute was set in the parent. The attribute is normalized
    # by converting to lowercase and changing ' ' characters to '_'
    #
    # Example:
    #
    #   "Mac OS X" => "mac_os_x"
    #
    attr_reader :os
    #
    # Contains the value of the arch attribute in the
    # parent <resources> element that contains this property
    # if the attribute was set in the parent.The attribute is normalized
    # by converting to lowercase and changing ' ' characters to '_'
    #
    # Examples:
    #
    #   "ppc i386" => "ppc_i386"
    #   "x86_64"   => "x86_64"
    #
    attr_reader :arch
    #
    # Creates a new Jnlp::Property object.
    # * _prop_: the Hpricot parsing of the specific jnlp/resources/property element
    # * _os_: optional: include it if the resources parent element that contains the property has this attribute set
    #
    def initialize(j2se, os=nil, arch=nil)
      @j2se = j2se
      @version = j2se['version']
      @max_heap_size = j2se['max-heap-size']
      @initial_heap_size = j2se['initial-heap-size']
      @java_vm_args = j2se['java-vm-args']
      @os = os
      @arch = arch
    end
  end
end