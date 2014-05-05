class Pitch < ActiveRecord::Base

	# associations
		belongs_to :task
		belongs_to :user

	# validations
		validates :price, presence: true, numericality: { greater_than: 0.5}
		validates :body, presence: true
		
	# plugins

	# other


end
