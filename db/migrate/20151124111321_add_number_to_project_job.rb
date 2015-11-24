class AddNumberToProjectJob < ActiveRecord::Migration
  def change
    add_column :project_jobs, :number, :integer
  end
end
