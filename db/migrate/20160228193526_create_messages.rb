class CreateMessages < ActiveRecord::Migration
  has_and_belongs_to_many :groups

  def change
    create_table :messages do |t|
      t.string :text
      t.string :head

      t.timestamps null: false
    end
  end
end
