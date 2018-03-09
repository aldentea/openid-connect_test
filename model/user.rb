class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => 40
  property :email, String, :length => 96
  property :kanrisya, Boolean, :default => false
  has n, :identities

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

	# You can use :iss and :sub?
	def self.create(attributes = {})
		isser = attributes.delete(:iss)
		sub = attributes.delete(:sub)
    identifier = attributes.delete(:identifier)
		u = super(attributes)
    if (isser & sub)
      u.identities.create(:iss => isser, :sub => sub)
    else
      u.identities.create(identifier)
    end
		u
	end

end

