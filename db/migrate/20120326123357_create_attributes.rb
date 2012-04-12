class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :content
      t.integer :identity_id

      t.timestamps
    end
    add_index :attributes, [:identity_id, :created_at]
  end
end
