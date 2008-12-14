require 'rubygems'

#RAILS_ENV = 'test'



require 'actionpack'
require 'action_view'
require 'activeresource'
require 'activesupport'
require 'action_controller'


class ApplicationController < ActionController::Base
  
end

require 'action_controller/test_process'
require 'action_controller/integration'
require 'active_record/fixtures' if defined?(ActiveRecord::Base)
require 'test/unit'

require 'spec'

require 'spec/rails/matchers'
require 'spec/rails/mocks'
require 'spec/rails/example'
require 'spec/rails/extensions'
require 'spec/rails/interop/testcase'


require File.expand_path(File.dirname(__FILE__) + "/../lib/robins_html_helpers")

