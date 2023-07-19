class CreateCarProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :car_profiles do |t|
      t.string :model, null: false
      t.integer :year, null: false
      t.decimal :mileage, null: false
      t.decimal :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
