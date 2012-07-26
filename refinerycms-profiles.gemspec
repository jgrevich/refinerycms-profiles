# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-profiles'
  s.version           = '0.1'
  s.description       = 'Ruby on Rails Profiles extension for Refinery CMS'
  s.date              = '2012-01-21'
  s.summary           = 'Profiles extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.authors           = %w(Justin\ Grevich)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # jquery autocomplete
  s.add_dependency  'rails3-jquery-autocomplete'

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.5'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.5'
end
