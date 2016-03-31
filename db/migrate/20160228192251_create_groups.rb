class CreateGroups < ActiveRecord::Migration
  has_and_belongs_to_many :messages

  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
