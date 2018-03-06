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

migration 2, :create_identities_table do
	up do
		create_table :identities do
			column :id, Integer, :serial => true
			column :user_id, Integer
			column :iss, String, :length => 256
			column :sub, String, :length => 256
		end
	end
	down do
		drop_table :identities
	end
end

migration 3, :add_email_column_to_users_table do
	up do
		modify_table :users do
			add_column :email, String, :length => 256
		end
	end
	down do
    modify_table :users do
			drop_column :email
    end
	end
end


#migrate_up!

