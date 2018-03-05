class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => 40
  property :kanrisya, Boolean, :default => false


end

