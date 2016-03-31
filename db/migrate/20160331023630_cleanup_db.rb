class CleanupDb < ActiveRecord::Migration
  def change
    drop_table :userprofiles
    drop_table :neinfos
    drop_table :mainfeeds
    drop_table :newsfeeds
  end
end
