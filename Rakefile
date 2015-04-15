require 'rake'
require 'rake/testtask'

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file }
end
task default: [:test]
