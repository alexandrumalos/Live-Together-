class RenameRequestTypeField < ActiveRecord::Migration
  def change
    # apparently "type" is a reserved word for rails so we can't use it
    remove_column :requests, :type
    add_column :requests, :request_type, :string
  end
end
