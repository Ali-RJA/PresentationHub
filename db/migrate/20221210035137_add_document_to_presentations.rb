class AddDocumentToPresentations < ActiveRecord::Migration[7.0]
  def change
    add_column :presentations, :document, :binary
  end
end
