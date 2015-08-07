class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :location_id, null: false
      t.integer :user_id, null: false
      t.integer :overall_rating, null: false
      t.integer :cleanliness_rating
      t.integer :spaciousness_rating
      t.text :body

      t.timestamps null: false
    end
  end
end
