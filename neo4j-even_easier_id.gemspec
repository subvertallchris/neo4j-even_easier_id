# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neo4j/even_easier_id/version'

Gem::Specification.new do |spec|
  spec.name          = "neo4j-even_easier_id"
  spec.version       = Neo4j::EvenEasierId::VERSION
  spec.authors       = ["Chris Grigg"]
  spec.email         = ["chris@subvertallmedia.com"]
  spec.summary       = "Configures a Neo4j.rb 3.0 model to use an even easier unique ID"
  spec.description   = "Automatically creates unique IDs based on the Ruby BSON object ID generation method."
  spec.homepage      = "https://github.com/subvertallchris/neo4j-even_easier_id"
  spec.license       = "Apache License Version 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "neo4j", '> 3.0.0.alpha.9'
end
