class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|

      t.timestamps null: false
    end
  end
end
