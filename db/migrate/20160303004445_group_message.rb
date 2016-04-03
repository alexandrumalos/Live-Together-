class GroupMessage < ActiveRecord::Migration
  def change
    create_table :group_message , id: false do |t|
      t.belongs_to :groups, index: true
      t.belongs_to :messages, index: true
    end
  end
end
