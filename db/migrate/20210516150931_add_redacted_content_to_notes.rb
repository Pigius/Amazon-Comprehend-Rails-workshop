class AddRedactedContentToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :redacted_content, :string, limit: 1000
  end
end
