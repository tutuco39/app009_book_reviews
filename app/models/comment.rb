class Comment < ApplicationRecord
  belongs_to :review
  validates :name, :body, presence: true
end
