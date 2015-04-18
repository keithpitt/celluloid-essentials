# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name         = 'celluloid-essentials'
  gem.version      = '0.20.0'
  gem.platform     = Gem::Platform::RUBY
  gem.summary      = 'Internally used tools, and superstructural dependencies of Celluloid'
  gem.description  = 'Notifications, Internals, Logging, and essential Celluloid pieces demanding Supervision'
  gem.licenses     = ['MIT']

  gem.authors      = ["Tony Arcieri", "digitalextremist //"]
  gem.email        = ['tony.arcieri@gmail.com', 'code@extremist.digital']
  gem.homepage     = 'https://github.com/celluloid/'

  gem.required_ruby_version     = '>= 1.9.2'
  gem.required_rubygems_version = '>= 1.3.6'

  gem.files        = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|examples|spec|features)/}) }
  gem.require_path = 'lib'

  gem.add_development_dependency 'bundler'
  gem.add_dependency 'celluloid-supervision'
end
