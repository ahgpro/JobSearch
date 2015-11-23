class CreateProjectJobs < ActiveRecord::Migration
  def change
    create_table :project_jobs do |t|
      t.references :project, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.integer :count
      t.float :price

      t.timestamps null: false
    end
  end
end
