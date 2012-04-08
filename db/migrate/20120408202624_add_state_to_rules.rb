class AddStateToRules < ActiveRecord::Migration
  def change
    add_column :rules, :state, :string, :default => 'pending'
  end
end
