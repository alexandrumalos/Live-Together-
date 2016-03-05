class CreateUserMessageConnection < ActiveRecord::Migration
  def change
    create_table :user_message_connections do |t|
      t.belongs_to :user, index: true
      t.belongs_to :message, index: true
    end

    add_column :messages, :user_id, :integer
  end
end
