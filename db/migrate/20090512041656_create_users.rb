class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name_first, :name_last, :login, :email_address, :crypted_password, :password_salt, :persistence_token, :single_access_token, :perishable_token, :current_login_ip, :last_login_ip
      t.integer :login_count, :failed_login_count
      t.datetime :last_request_at, :current_login_at, :last_login_at

      t.timestamps
    end

    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_request_at
    add_index :users, :email_address
  end

  def self.down
    drop_table :users
  end
end
