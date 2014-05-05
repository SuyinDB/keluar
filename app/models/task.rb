class Task < ActiveRecord::Base

# associations
	belongs_to :user

# validations

  validates :title, presence: true, length: { minimum: 5}
	validates :task_type, presence: true
	validates :description, presence: true
	validates :address, presence: true
	validates :budget, presence: true

# plugins

	geocoded_by :address
	after_validation :geocode

# other


end
