# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{robins_html_helpers}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robin Spainhour"]
  s.date = %q{2009-06-11}
  s.description = %q{HTML stuff I use frequently.}
  s.email = %q{robin@robinspainhour.com}
  s.extra_rdoc_files = ["tasks/rspec.rake", "lib/robins_html_helpers.rb", "lib/robins_html_helpers/form_builder.rb", "README.rdoc"]
  s.files = ["tasks/rspec.rake", "lib/robins_html_helpers.rb", "lib/robins_html_helpers/form_builder.rb", "README.rdoc", "Rakefile", "spec/helpers/helpers_spec.rb", "spec/railsenv/app/controllers/application_controller.rb", "spec/railsenv/config/routes.rb", "spec/railsenv/config/initializers/backtrace_silencers.rb", "spec/railsenv/config/initializers/mime_types.rb", "spec/railsenv/config/initializers/inflections.rb", "spec/railsenv/config/initializers/session_store.rb", "spec/railsenv/config/initializers/new_rails_defaults.rb", "spec/railsenv/config/environment.rb", "spec/railsenv/config/locales/en.yml", "spec/railsenv/config/boot.rb", "spec/railsenv/config/database.yml", "spec/railsenv/config/environments/development.rb", "spec/railsenv/config/environments/test.rb", "spec/railsenv/config/environments/production.rb", "spec/railsenv/db/test.sqlite3", "spec/spec_helper.rb", "spec/spec.opts", "spec/models/form_builder_spec.rb", "spec/models/form_builder_hint_options_spec.rb", "Manifest", "robins_html_helpers.gemspec", "rails_generators/robins_layout/templates/layout.css", "rails_generators/robins_layout/templates/application.html.erb", "rails_generators/robins_layout/robins_layout_generator.rb", "rails_generators/robins_layout/USAGE", "rails_generators/robins_html_helpers_resources/templates/robins_html_helpers.css", "rails_generators/robins_html_helpers_resources/templates/robins_html_helpers.js", "rails_generators/robins_html_helpers_resources/USAGE", "rails_generators/robins_html_helpers_resources/robins_html_helpers_resources_generator.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/robinsp/robins_html_helpers}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Robins_html_helpers", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{robins_html_helpers}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{HTML stuff I use frequently.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
