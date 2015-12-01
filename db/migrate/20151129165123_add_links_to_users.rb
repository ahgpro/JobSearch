class AddLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sociallink1, :string
    add_column :users, :sociallink2, :string
    add_column :users, :sociallink3, :string
  end
end
