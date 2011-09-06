require 'rubygems'
require "bundler"

require 'rspec/core/rake_task'
require 'yard'
require 'rdoc/task'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

Bundler::GemHelper.install_tasks

desc "Run RSpec"
RSpec::Core::RakeTask.new do |t|
  t.verbose = false
end

task :default => :spec

namespace :hudson do
  require 'ci/reporter/rake/rspec'
  desc "run the spec tests and generate JUnit XML reports (for integrating with a Hudson CIS server)"
  task :spec => ["hudson:setup:rspec", 'rake:spec']

  namespace :setup do
    task :pre_ci do
      ENV["CI_REPORTS"] = 'spec/reports/'
      gem 'ci_reporter'
      require 'ci/reporter/rake/rspec'
    end
    task :rspec => [:pre_ci, "ci:setup:rspec"]
  end
end

# Documentation tasks
#
# You can generate the doc by hand as follows:
#
#   rdoc -U --main=README.rdoc --title='Jnlp::Jnlp' README.rdoc History.txt License.txt lib
#
#   yardoc -o ydoc - README.rdoc History.txt License.txt

YARD::Rake::YardocTask.new do |ydoc|
  ydoc.files   = ["lib/**/*.rb", "-", "README.rdoc", 'History.txt', 'License.txt']
  ydoc.options = ['-o', 'ydoc', '--main', 'README.rdoc']
end

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.template = "darkfish"
  rdoc.main = "README.rdoc"
  rdoc.title = 'Jnlp::Jnlp'
  rdoc.rdoc_files.include("README.rdoc", 'History.txt', 'License.txt', "lib/**/*.rb")
  rdoc.options += ['-f', 'darkfish']
end

