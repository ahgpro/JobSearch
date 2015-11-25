class AddMediaToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :media, :integer
  end
end
