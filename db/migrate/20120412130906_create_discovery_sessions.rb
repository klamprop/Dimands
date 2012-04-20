class CreateDiscoverySessions < ActiveRecord::Migration
  def change
    create_table :discovery_sessions do |t|
      t.integer :user_id
      t.integer :discovery_session_id

      t.timestamps
    end
  end
end
