class CreatePostulants < ActiveRecord::Migration
  def change
    create_table :postulants do |t|
      t.references :project_job, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
