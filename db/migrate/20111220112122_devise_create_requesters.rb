class DeviseCreateRequesters < ActiveRecord::Migration
  def change
    create_table(:requesters) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :requesters, :email,                :unique => true
    add_index :requesters, :reset_password_token, :unique => true
    # add_index :requesters, :confirmation_token,   :unique => true
    # add_index :requesters, :unlock_token,         :unique => true
    # add_index :requesters, :authentication_token, :unique => true
  end

end
