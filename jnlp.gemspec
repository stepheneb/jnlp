(in /Users/stephen/dev/ruby/src/gems/jnlp-git)
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jnlp}
  s.version = "0.0.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stephen Bannasch"]
  s.date = %q{2010-02-11}
  s.description = %q{For manipulation of Java Web Start Jnlps and the resources they reference.}
  s.email = %q{stephen.bannasch@gmail.com}
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/jnlp.rb", "lib/jnlp/version.rb", "lib/jnlp/jnlp.rb", "lib/jnlp/otrunk.rb", "lib/jnlp/maven_jnlp.rb", "spec/jnlp_spec.rb", "spec/jnlp_with_certficate_versions_spec.rb", "spec/jnlp_without_versioned_jars_spec.rb", "spec/spec_helper.rb", "spec/fixtures/all-otrunk-snapshot-0.1.0-20090624.030355.jnlp", "spec/fixtures/all-otrunk-snapshot-CURRENT_VERSION.txt", "spec/fixtures/all-otrunk-snapshot-0.1.0-20091221.214313.jnlp", "spec/fixtures/jnlp_without_versioned_jars.jnlp", "spec/fixtures/maven-jnlp.html"]
  s.homepage = %q{http://rubywebstart.rubyforge.org/jnlp/rdoc/}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rubywebstart}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby tools for working with Java Web Start JNLPs.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, ["= 0.6.164"])
      s.add_development_dependency(%q<hoe>, [">= 2.4.0"])
    else
      s.add_dependency(%q<hpricot>, ["= 0.6.164"])
      s.add_dependency(%q<hoe>, [">= 2.4.0"])
    end
  else
    s.add_dependency(%q<hpricot>, ["= 0.6.164"])
    s.add_dependency(%q<hoe>, [">= 2.4.0"])
  end
end
