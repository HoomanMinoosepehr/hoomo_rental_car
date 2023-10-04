class Like < ApplicationRecord

  belongs_to :user
  belongs_to :comment

  # the combination of the user id and comment id should be unique (user can only like a comment once)
  validates :user_id, uniqueness: { scope: :comment_id }
  
end
