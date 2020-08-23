class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :following, :integer
    add_column :users, :follower, :integer
  end
end
