class AddSkillzToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skillz, :string
  end
end
