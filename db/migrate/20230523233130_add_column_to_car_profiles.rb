class AddColumnToCarProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :car_profiles, :location, :string
  end
end
