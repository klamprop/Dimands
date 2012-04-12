class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :identifier
      t.string :domain
      t.integer :TRID
      t.integer :RID
      t.integer :user_id

      t.timestamps
    end
   add_index :identities, [:user_id, :created_at]
  end
end
