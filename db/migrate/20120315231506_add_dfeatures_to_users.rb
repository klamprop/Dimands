class AddDfeaturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usid, :integer

    add_column :users, :username, :string

  end
end
