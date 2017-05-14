class CreateTrafficDisruptions < ActiveRecord::Migration[5.1]
  def change
    create_table :traffic_disruptions do |t|
      t.integer :disruption_id, index: true
      t.integer :status, index: true
      t.integer :severity
      t.integer :level_of_interest
      t.string :category
      t.string :subcategory
      t.datetime :event_start_at
      t.datetime :event_end_at
      t.string :location
      t.string :comments
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
