class ChangeContentLimitInNotes < ActiveRecord::Migration[6.1]
  def change
    change_column :notes, :content, :string, limit: 1000
  end
end
