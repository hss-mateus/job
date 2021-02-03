class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.belongs_to :job_posting, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :job_applications, [:job_posting_id, :user_id], unique: true
  end
end
