class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.text :password
      t.string :email
      t.string :full_name
      t.string :user_name
      t.string :uid
      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :uid,    unique: true
  end
end



