class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null:false
      t.string :last_name
      t.string :email, null:false
      t.string :password_digest, null: false
      t.boolean :admin

      t.timestamps
    end
  end
end
