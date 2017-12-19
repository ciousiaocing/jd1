class AddAasmStateToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :state, :string, default: "pending"
    add_index :orders, :state
  end
end
