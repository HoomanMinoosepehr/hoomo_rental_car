class AddColumnToCarProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :car_profiles, :content, :text
  end
end
