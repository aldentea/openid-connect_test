require 'dm-core'

require_relative 'setup'

require_relative 'user'
require_relative 'identity'

Identity.finalize
User.finalize

