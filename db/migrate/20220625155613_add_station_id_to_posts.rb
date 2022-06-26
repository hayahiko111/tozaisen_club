class AddStationIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :station_id, :integer, null: false
  end
end
