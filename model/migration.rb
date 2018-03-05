require 'dm-migrations'
require 'dm-migrations/migration_runner'

require_relative 'setup'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.logger.debug("Starting Migration")

migration 1, :create_users_table do
  up do 
    create_table :users do
      column :id, Integer, :serial => true
      column :name, String, :length => 40
      column :kanrisya, DataMapper::Property::Boolean, :default => false
    end
  end
  down do
    drop_table :users
  end
end

#migrate_up!

