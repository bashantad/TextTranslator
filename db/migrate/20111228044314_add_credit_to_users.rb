class AddCreditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit, :float, :default => 5.0
  end
end
