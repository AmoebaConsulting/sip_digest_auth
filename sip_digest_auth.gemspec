# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sip_digest_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "sip_digest_auth"
  spec.version       = SipDigestAuth::VERSION
  spec.authors       = ["Daniel Jabbour"]
  spec.email         = ["sayhi@amoe.ba"]
  spec.description   = "Implementation of SIP Digest Authentication as specified in RFC3261"
  spec.summary       = "This gem is to be used with a SIP server to implement Digest Authentication, like HTTP authentication (specified in RFC2617)"
  spec.homepage      = "http://github.com/AmoebaLabs/sip_digest_auth"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.2.0"
end
