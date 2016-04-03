class ChangeNewserTypeToType < ActiveRecord::Migration
  def change
    remove_column :users, :newser_type
    add_column :users, :type, :string
  end
end
