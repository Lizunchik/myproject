class Project < ApplicationRecord
	  has_many :todos, dependent: :destroy

  validates :title,
            presence: true,
            uniqueness: true
	scope :with_todos, -> { Project.includes(:todos).where.not(todos: {id: nil}).order(:updated_at) }
end
