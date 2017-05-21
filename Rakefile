require 'rake/testtask'

task :default => [:spec]

desc 'Run specs'
Rake::TestTask.new(name=:spec) do |t|
  t.pattern = 'spec/acceptance_spec/*_spec.rb'
end
