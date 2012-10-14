module Jnlp #:nodoc:

  #
  # Icon objects encapsulate the <icon> element optionally present in
  # the Java Web Start jnlp <information> element.
  #
  class Icon
    #
    # Contains the Hpricot element parsed from the orginal Jnlp
    # that was used to create the Icon
    #
    attr_reader :icon
    #
    # Contains the href attribute of the <icon> element.
    #
    # Example:
    #
    #   "http://itsi.concord.org/images/itsi-logo-64x64.png"
    #
    attr_reader :href
    #
    # Contains the height attribute of the <icon> element
    #
    # Example:
    #
    #   64
    #
    attr_reader :height
    #
    # Contains the width attribute of the <icon> element
    #
    # Example:
    #
    #   64
    #
    attr_reader :width
    #
    # Creates a new Icon object
    # * _icon_: pass in a Hpricot parse of the <icon> element
    #
    def initialize(icon)
      @icon = icon
      @href = icon.attr('href').value
      @height = icon.attr('height').value.to_i
      @width = icon.attr('width').value.to_i
    end
  end
end