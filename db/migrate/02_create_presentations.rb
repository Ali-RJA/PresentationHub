class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.string :name
      t.datetime :date
      t.string :topic

      t.timestamps

      # Foreign key constraints
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
