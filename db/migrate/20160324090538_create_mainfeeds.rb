class CreateMainfeeds < ActiveRecord::Migration
  def change
    create_table :mainfeeds do |t|

      t.timestamps null: false
    end
  end
end
