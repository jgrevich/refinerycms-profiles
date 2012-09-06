# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-profiles'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Profiles extension for Refinery CMS'
  s.date              = '2012-07-25'
  s.summary           = 'Profiles extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = %w(Justin\ Grevich)

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.5'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.5'
  
  s.add_dependency  'rails3-jquery-autocomplete'
  s.add_dependency    'acts-as-taggable-on', '~> 2.3.1'
end
