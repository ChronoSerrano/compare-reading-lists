# frozen_string_literal: true

require 'bundler/setup'

require 'active_record'
require 'rubocop/rake_task'

::RuboCop::RakeTask.new

load 'tasks/otr-activerecord.rake'

OTR::ActiveRecord.db_dir = 'database'
OTR::ActiveRecord.migrations_paths = ['database/migrations']
OTR::ActiveRecord.fixtures_path = 'test/fixtures'
OTR::ActiveRecord.seed_file = 'seeds.rb'

namespace :db do
  task :environment do
    require_relative 'config/application'
  end
end
