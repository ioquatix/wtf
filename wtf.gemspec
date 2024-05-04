# frozen_string_literal: true

require_relative "lib/wtf/version"

Gem::Specification.new do |spec|
	spec.name = "wtf"
	spec.version = WTF::VERSION
	
	spec.summary = "WTF is your program doing?"
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/ioquatix/wtf"
	
	spec.metadata = {
		"documentation_uri" => "https://ioquatix.github.io/wtf/",
		"funding_uri" => "https://github.com/sponsors/ioquatix/",
		"source_code_uri" => "https://github.com/ioquatix/wtf.git",
	}
	
	spec.files = Dir.glob(['{lib}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.1"
end
