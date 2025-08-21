class Review < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :author, :body, presence: true
  validates :rating, inclusion: { in: 1..5, message: "は1〜5で選んでください" }
end
