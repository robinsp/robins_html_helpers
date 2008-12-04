# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{robins_html_helpers}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robin Spainhour"]
  s.date = %q{2008-12-04}
  s.description = %q{HTML stuff I use frequently.}
  s.email = %q{robin@robinspainhour.com}
  s.extra_rdoc_files = ["lib/robins_html_helpers.rb", "README.rdoc"]
  s.files = ["robins_html_helpers.gemspec", "Rakefile", "Manifest", "lib/robins_html_helpers.rb", "README.rdoc"]
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
