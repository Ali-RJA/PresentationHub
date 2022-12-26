class RemoveNameFromPresentations < ActiveRecord::Migration[7.0]
  def change
    remove_column :presentations, :name, :string
  end
end
