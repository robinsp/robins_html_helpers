# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('robinsp-robins_html_helpers', '0.1.0') do |p|
  p.description    = "HTML stuff I use frequently."
  p.url            = "http://github.com/robinsp/robins_html_helpers"
  p.author         = "Robin Spainhour"
  p.email          = "robin@robinspainhour.com"
  p.ignore_pattern = ["tmp/*", "script/*", ".project"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
