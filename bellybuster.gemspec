require File.expand_path("../lib/bellybuster/version", __FILE__)
require 'base64'

Gem::Specification.new do |s|
  s.name = %q{bellybuster}
  s.version = BellyBuster::VERSION

  s.authors = %x{git log --pretty=format:"%an"}.split("\n")
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.description = %q{Dynamic distribution and installation of packages (i.e. gem, ruby script, etc) to any interested client.}
  s.email = Base64.decode64 "Y3JhaWdAbWluZHNjcmF0Y2gub3Jn\n"
  s.homepage = %q{http://github.com/mindscratch/bellybuster}

  s.files = `git ls-files`.split(/\n/)
  s.require_paths = ["lib"]


  s.rdoc_options = ["--charset=UTF-8"]

  s.summary = %q{Dynamic distribution and installation of packages}
  s.test_files = Dir.glob("test/**/*")
  s.add_development_dependency(%q<rspec>, [">= 0"])

  begin
    require "changelog"
  rescue LoadError
    warn "You have to have changelog gem installed for post install message"
  else
    s.post_install_message = CHANGELOG.new('CHANGELOG').version_changes
  end

  # RubyForge
  # s.rubyforge_project = "bellybuster"
end