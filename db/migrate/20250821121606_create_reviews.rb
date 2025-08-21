class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
