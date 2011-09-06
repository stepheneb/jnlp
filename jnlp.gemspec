$:.push File.expand_path("../lib", __FILE__)  
require 'jnlp'

Gem::Specification.new do |s|
  s.name = 'jnlp'
  s.version = Jnlp::VERSION
  s.authors = ["Stephen Bannasch"]
  s.email = 'stephen.bannasch@gmail.com'
  s.homepage = 'https://github.com/stepheneb/jnlp'
  s.summary = %q{Ruby tools for working with Java Web Start JNLPs.}
  s.description = %q{For manipulation of Java Web Start Jnlps and the resources they reference.}
  s.date = '2011-06-02'
  s.rubyforge_project = 'rubywebstart'

  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = %w{ README.rdoc History.txt License.txt }
  
  s.required_rubygems_version = ">= 1.3.5"
  s.require_path = 'lib'

  s.files =  Dir.glob("{lib,spec}/**/*.{rb}")

  s.add_runtime_dependency('nokogiri', ">= 1.4.4", "<= 1.5")

  s.add_development_dependency('rake')
  s.add_development_dependency("rspec", '~> 2.6')
  s.add_development_dependency("ci_reporter", '~> 1.6')
  s.add_development_dependency('rdoc', '~> 3.9.4')
  s.add_development_dependency('yard', '~> 0.7.2')
  
  s.post_install_message = <<-POST_INSTALL_MESSAGE

  Thanks for installing: jnlp-#{s.version}

  Documentation: http://rdoc.info/github/stepheneb/jnlp/master/file/README.rdoc
  Repository:    http://github.com/stepheneb/jnlp

  POST_INSTALL_MESSAGE
end
