(in /Users/stephen/dev/ruby/src/gems/jnlp-git)
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jnlp}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stephen Bannasch"]
  s.date = %q{2009-03-07}
  s.description = %q{For manipulation of Java Web Start Jnlps and the resources they reference.}
  s.email = ["stephen.bannasch@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/jnlp.rb", "lib/jnlp/version.rb", "lib/jnlp/jnlp.rb", "lib/jnlp/otrunk.rb", "log/debug.log", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_helper.rb", "test/test_jnlp.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://jnlp.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jnlp}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{For manipulation of Java Web Start Jnlps and the resources they reference.}
  s.test_files = ["test/test_helper.rb", "test/test_jnlp.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
