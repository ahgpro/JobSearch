class RemoveMediaFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :media, :integer
  end
end
