$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'

gem 'nokogiri', '>= 1.4.4', "<= 1.5"

module Jnlp
  require 'jnlp/property.rb'
  require 'jnlp/j2se.rb'
  require 'jnlp/icon.rb'
  require 'jnlp/resource.rb'
  require 'jnlp/jnlp.rb'
  require 'jnlp/otrunk.rb'
  require 'jnlp/maven_jnlp.rb'
  require 'jnlp/version.rb'
end