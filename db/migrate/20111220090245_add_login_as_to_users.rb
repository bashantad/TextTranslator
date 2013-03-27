class AddLoginAsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_as, :string
  end
end
