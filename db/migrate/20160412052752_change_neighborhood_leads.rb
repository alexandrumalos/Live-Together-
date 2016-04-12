class ChangeNeighborhoodLeads < ActiveRecord::Migration
  def change
    remove_column :neighborhood_leads, :lead_id
    add_column :neighborhood_leads, :user_id, :integer
  end
end
