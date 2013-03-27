class AddCreditToRequesters < ActiveRecord::Migration
  def change
    add_column :requesters, :credit, :float, :default => 1000
  end
end
