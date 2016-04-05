class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|

      t.timestamps null: false
    end

    add_column :user_messages, :user_id, :integer
    add_column :user_messages, :message_id, :integer
    add_index :user_messages, :user_id
    add_index :user_messages, :message_id
  end
end
