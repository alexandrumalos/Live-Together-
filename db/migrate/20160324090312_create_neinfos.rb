class CreateNeinfos < ActiveRecord::Migration
  def change
    create_table :neinfos do |t|

      t.timestamps null: false
    end
  end
end
