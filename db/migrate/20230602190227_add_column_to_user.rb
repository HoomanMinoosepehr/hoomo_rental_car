class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmed_email, :boolean
    add_column :users, :confirmed_email_code, :string
  end
end
