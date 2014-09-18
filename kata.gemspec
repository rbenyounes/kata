# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
    s.name          = 'kata'
    s.version       = '0.0.1'
    s.date          = '2014-09-16'
    s.summary       = 'Kata de tennis.'
    s.description   = 'Une application de Kata de tennis.'
    s.authors       = ["Romdhane BEN YOUNES"]
    s.email         = 'info@romdhane.ca'
    s.test_files    = [
        'test/test_echange.rb',
        'test/test_partie.rb',
    ]
    s.files         = [
        'Rakefile',
        'README.md',
        'state_machine.jpg',
        'lib/kata.rb',
        'lib/kata/echange.rb',
        'lib/kata/partie.rb',
        'lib/kata/kata_error.rb',
    ]
    s.executables   = [
        'kata'
    ]
    s.homepage      = 'http://rubygems.org/gems/kata'
    s.license       = 'MIT'
    s.require_paths = ["lib"]
end
