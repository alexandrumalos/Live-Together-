class CreateGroupMessages < ActiveRecord::Migration
  def change
    create_table :group_messages do |t|
      t.integer :group_id, index: true
      t.integer :message_id, index: true

      t.timestamps null: false
    end
  end
end
