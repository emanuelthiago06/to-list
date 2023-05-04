class TodoItem < ApplicationRecord
  belongs_to :todo_list
  def is_completed
    !completed_at.blank?
  end
end

