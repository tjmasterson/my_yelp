class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
