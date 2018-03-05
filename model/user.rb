class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => 40
  property :kanrisya, Boolean, :default => false


  def self.find_by_identity(issuer, sub = nil)
		params = issuer.is_a?(Hash) ? issuer : {:iss => issuer, :sub => sub}
#		self.first(:identity_uri => uri)
		identity = Identity.first(params)
		identity ? identity.user : nil
	end

	def identifiers
		# ハッシュの配列を返す
		self.identities.map(&:identifier)
	end

	# You can use :iss and :sub.
	def self.create(attributes = {})
		isser = attributes.delete(:iss)
		sub = attributes.delete(:sub)
		u = super(attributes)
		u.identities.create(:iss => isser, :sub => sub) if isser && sub
		u
	end

end

