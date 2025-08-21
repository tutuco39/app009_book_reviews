# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Faker::Config.locale = 'en'

10.times do
  review = Review.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    author: Faker::Name.name,
    body: Faker::Lorem.sentence(word_count: 50),
    rating: Faker::Number.between(from: 2, to: 5)
  )

  # 2〜3件のコメントをランダムで作成
  rand(2..3).times do
    review.comments.create!(
      name: Faker::Internet.username(separators: %w[_ .]),
      body: Faker::Lorem.sentence(word_count: 30)
    )
  end
end