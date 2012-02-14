Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-profiles'
  s.version           = '0.1'
  s.description       = 'Ruby on Rails Profiles engine for Refinery CMS'
  s.date              = '2012-01-21'
  s.summary           = 'Profiles engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
  s.add_dependency  'rails3-jquery-autocomplete'
end