class Project < ApplicationRecord
	has_many :todos
	scope :with_todos, -> { Project.includes(:todos).where.not(todos: {id: nil}).order(:updated_at) }
end
