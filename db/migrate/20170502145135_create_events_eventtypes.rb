class CreateEventsEventtypes < ActiveRecord::Migration[5.1]
  def change
    create_table :events_eventtypes, id: false do |t|
      t.integer :eventtype_id
      t.integer :event_id
    end
  end
end
