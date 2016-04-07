class CreateNeighborhoodLeads < ActiveRecord::Migration
  def change
    create_table :neighborhood_leads do |t|
      t.integer :lead_id, index: true
      t.integer :neighborhood_id, index: true

      t.timestamps null: false
    end
  end
end
