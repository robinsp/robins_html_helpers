class RobinsHtmlHelpersResourcesGenerator < Rails::Generator::Base
  def manifest 
    puts "Installing"
    record do |m|
      m.file 'robins_html_helpers.js', 
             'public/javascripts/robins_html_helpers.js', 
             :collision => :ask
      
      m.file 'robins_html_helpers.css', 
             'public/stylesheets/robins_html_helpers.css', 
             :collision => :ask
    end
  end
end