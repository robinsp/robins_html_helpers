class RobinsLayoutGenerator < Rails::Generator::Base
  def manifest 
    puts "Installing"
    record do |m|
      m.file 'application.html.erb', 
             'app/views/layouts/application.html.erb', 
             :collision => :ask
      
      m.file 'layout.css', 
             'public/stylesheets/layout.css', 
             :collision => :ask
    end
  end
end
