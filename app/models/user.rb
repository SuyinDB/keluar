class User < ActiveRecord::Base

	# associations
		has_many :tasks
		has_many :pitches

	# validations
		validates :username, presence: true, uniqueness: true, if: ->{ provider.nil? }
		validates :email, presence: true, uniqueness: true, if: ->{ provider.nil? }

	# plugins
	has_secure_password

	# other

end
