class FixCartIdNameInCartItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :cart_items, :card_id, :cart_id
  end
end
