class RemoveCountFromProjectJob < ActiveRecord::Migration
  def change
    remove_column :project_jobs, :count, :integer
  end
end
