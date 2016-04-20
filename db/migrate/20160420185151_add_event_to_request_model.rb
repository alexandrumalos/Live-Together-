class AddEventToRequestModel < ActiveRecord::Migration
  def change
    add_column :requests, :event_id, :integer
    add_index :requests, :event_id

    add_column :events, :request_id, :integer
    add_index :events, :request_id
  end
end
