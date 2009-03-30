require 'rubygems'
require 'hoe'

require './lib/jnlp.rb'

AUTHOR = 'Stephen Bannasch'  # can also be an array of Authors
EMAIL = "stephen.bannasch@gmail.com"
DESCRIPTION = "For manipulation of Java Web Start Jnlps and the resources they reference."
GEM_NAME = 'jnlp' # what ppl will type to install your gem
RUBYFORGE_PROJECT = 'rubywebstart' # The unix name for your project
HOMEPATH = "http://#{RUBYFORGE_PROJECT}.rubyforge.org"
DOWNLOAD_PATH = "http://rubyforge.org/projects/#{RUBYFORGE_PROJECT}"


Hoe.new('jnlp', Jnlp::VERSION.to_s) do |p|
  p.rubyforge_name = 'rubywebstart' # if different than lowercase project name
  p.author = 'Stephen Bannasch'
  p.email = 'stephen.bannasch@gmail.com'
  p.url = 'http://rubywebstart.rubyforge.org/jnlp/rdoc/'
  p.summary = "Ruby tools for working with Java Web Start JNLPs."
  p.description = "For manipulation of Java Web Start Jnlps and the resources they reference."
  p.extra_deps << ['hpricot','=0.6.164']
end
