class AddMediaToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :media, :string
  end
end
