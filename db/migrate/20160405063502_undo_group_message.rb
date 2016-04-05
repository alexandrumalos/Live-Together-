class UndoGroupMessage < ActiveRecord::Migration
  def change
    drop_table :group_message
  end
end
