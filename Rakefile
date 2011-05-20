desc "Build the gem"
task :gem do
  sh 'gem build *.gemspec'
end

desc "Regenerate contributors file."
task :contributors do
  authors = %x{git log | grep ^Author:}.split("\n")
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