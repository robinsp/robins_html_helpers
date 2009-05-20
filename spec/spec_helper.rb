# The minimal Rails project was created to run specs against using:
# rails -m http://github.com/robinsp/rails_templates/raw/master/minimal.rb railsenv


ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/railsenv/config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.mock_with :mocha
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

dir = File.expand_path(File.dirname(__FILE__))
require "#{dir}/../lib/robins_html_helpers"
require "#{dir}/../lib/robins_html_helpers/form_builder"
