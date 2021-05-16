class AddDetectedEntitiesToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :detected_pii_entities, :string, array: true, default: []
  end
end
