module Jnlp #:nodoc:
  #
  # Property objects encapsulate <property> elements present in a
  # Java Web Start Jnlp <resources> element.
  #
  class Property
    #
    # Contains the Hpricot element parsed from the orginal Jnlp
    # that was used to create the Property
    #
    attr_reader :property
    #
    # Contains the name of the Property
    #
    #
    # Example:
    #
    #   "maven.jnlp.version"
    #
    attr_reader :name
    #
    # Contains the value of the Property
    #
    #
    # Example:
    #
    #   "all-otrunk-snapshot-0.1.0-20080310.211515"
    #
    attr_reader :value
    #
    # Contains the value of the os attribute in the
    # parent <resources> element that contains this property
    # if the attribute was set in the parent.
    # Example:
    #
    #   "Mac OS X"
    #
    attr_reader :os
    #
    # Creates a new Jnlp::Property object.
    # * _prop_: the Hpricot parsing of the specific jnlp/resources/property element
    # * _os_: optional: include it if the resources parent element that contains the property has this attribute set
    #
    def initialize(prop, os=nil)
      @property = prop
      @name = prop['name']
      @value = prop['value']
      @os = os
    end
  end
end