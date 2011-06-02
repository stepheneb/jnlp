GEM_ROOT = File.expand_path(File.dirname(__FILE__))
$:.unshift File.join(GEM_ROOT, 'lib')
require 'jnlp'

Gem::Specification.new do |s|
  s.name = 'jnlp'
  s.version = Jnlp::VERSION
  s.authors = ["Stephen Bannasch"]
  s.email = 'stephen.bannasch@gmail.com'
  s.homepage = 'http://rubywebstart.rubyforge.org/jnlp/rdoc'
  s.summary = %q{Ruby tools for working with Java Web Start JNLPs.}
  s.description = %q{For manipulation of Java Web Start Jnlps and the resources they reference.}
  s.date = '2010-02-11'
  s.rubyforge_project = 'rubywebstart'

  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = %w{ History.txt License.txt README.rdoc}
  
  s.required_rubygems_version = ">= 1.3.5"
  s.require_path = 'lib'

  s.files =  Dir.glob("{lib,spec}/**/*.{rb}") + %w{ History.txt License.txt README.rdoc Rakefile jnlp.gemspec }

  s.add_runtime_dependency('nokogiri', "~> 1.4.4")  
  s.add_development_dependency("rspec", '~> 2.5.0')
  s.add_development_dependency("ci_reporter", '>= 1.6.0')
  
  s.post_install_message = <<-POST_INSTALL_MESSAGE

  Thanks for installing: jnlp-#{s.version}

  Documentation: http://rdoc.info/projects/stepheneb/jnlp
  Repository:    http://github.com/stepheneb/jnlp

  POST_INSTALL_MESSAGE
end
