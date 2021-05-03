class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :content, null: false, limit: 500

      t.timestamps
    end
  end
end
