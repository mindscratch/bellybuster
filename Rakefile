#require 'bundler/setup';
#Bundler.setup(:default, :development)

require 'bundler'
require 'rubygems/package_task'
Bundler::GemHelper.install_tasks

spec = Gem::Specification.load(Dir["*.gemspec"].first)
Gem::PackageTask.new(spec) do |p|
  p.need_zip = true
  p.need_tar = true
end

require 'rspec/core/rake_task'

desc "Run all RSpec tests"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color']
end


desc "Regenerate contributors file."
task :contributors do
  # probably some better way to get the author name, however using just 'git log' didn't include it
  authors = %x{git log --pretty=format:"%an"}.split("\n")
  results = authors.reduce(Hash.new) do |results, line|
    name = line.sub(/^Author: (.+) <.+>$/, '\1')
    results[name] ||= 0
    results[name] += 1
    results
  end
  results = results.sort_by { |_, count| count }.reverse
  File.open("CONTRIBUTORS", "w") do |file|
    results.each do |name, count|
      file.puts "#{name}: #{count}"
    end
  end
end
