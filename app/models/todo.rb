class Todo < ApplicationRecord
 belongs_to :project

  validates :todoname, :project,
            presence: true
			# checked : false

  validate :ensure_not_checked, on: :create
@opened=false;
@checked=false;
 def is_opened?
  return @opened
end

def check
	@checked=true;
end


  def ensure_not_checked
    errors.add(:todo, "can't be already completed!") if checked?
  end
end
