if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start { add_filter '/spec/' }
end

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'rspec/its'
require 'useful_objects'
