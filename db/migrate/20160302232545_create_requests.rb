class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.date :date
      t.string :type

      t.timestamps null: false
    end
  end
end
