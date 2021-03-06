# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ar_serialized_array}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = %q{2011-01-17}
  s.email = %q{grosser.michael@gmail.com}
  s.files = [
    "Gemfile",
    "Rakefile",
    "Readme.md",
    "VERSION",
    "ar_serialized_array.gemspec",
    "init.rb",
    "lib/ar_serialized_array.rb",
    "spec/ar_serialized_array_spec.rb",
    "spec/setup_test_model.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/grosser/ar_serialized_array}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Serialize an array in a column, [] when no set, xx_as_text accessors and more.}
  s.test_files = [
    "spec/ar_serialized_array_spec.rb",
    "spec/setup_test_model.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
  end
end

