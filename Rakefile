require 'bundler/gem_tasks'

task default: [:spec]
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = %w(--format documentation --color)
  end
rescue LoadError => e
  puts e.message
end