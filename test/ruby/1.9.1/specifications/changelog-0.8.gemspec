# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{changelog}
  s.version = "0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.cert_chain = nil
  s.date = %q{2011-05-01}
  s.description = %q{}
  s.email = %q{stastny@101ideas.cz}
  s.homepage = %q{http://github.com/botanicus/changelog}
  s.post_install_message = %q{[[32mVersion 0.8[0m] Play nicely with multiple lines per item [#3].
}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{changelog}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Simple CHANGELOG parser.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
