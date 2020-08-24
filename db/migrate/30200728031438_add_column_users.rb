class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :following, :integer ,default: 0
    add_column :users, :follower, :integer,default: 0
  end
end
