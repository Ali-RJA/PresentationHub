class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :comments
      t.integer :rating

      t.timestamps

      # Foreign key constraints
      t.belongs_to :presentation, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
