require 'rake/testtask'

Dir.glob('./{config,controllers,forms,lib,views,models}/init.rb').each do |file|
  require file
end

task :default => [:spec]

desc 'Run specs'
Rake::TestTask.new(name=:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
end

namespace :deploy do
  task :config do
    require 'config_env/rake_tasks'
    ConfigEnv.path_to_config("#{__dir__}/config/config_env.rb")
    Rake::Task['deploy:config_env:heroku'].invoke
  end
end

namespace :db do
  require 'sequel'
  Sequel.extension :migration

  desc 'Run migrations'
  task :migrate do
    puts "Environment: #{ENV['RACK_ENV'] || 'development'}"
    puts 'Migrating to latest'
    Sequel::Migrator.run(DB, 'db/migrations')
  end

  desc 'Perform migration reset (full rollback and migration)'
  task :reset do
    Sequel::Migrator.run(DB, 'db/migrate', target: 0)
    Sequel::Migrator.run(DB, 'db/migrate')
  end

  desc 'Populate the database with test values'
  task :seed do
    load './db/seeds/user_secret_sharing.rb'
  end

  desc 'Reset and repopulate database'
  task :reseed => [:reset, :seed]
end
