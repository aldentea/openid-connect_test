class Identity

	include DataMapper::Resource

	property :id, Serial
	belongs_to :user, 'User', :parent_key => [:id], :child_key => [:user_id]
	property :iss, String, :length => 256
	property :sub, String, :length => 256

	def identifier
		{:iss => iss, :sub => sub}
	end

end
