class AddConfirmationToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :confirmation, :string
  end
end
