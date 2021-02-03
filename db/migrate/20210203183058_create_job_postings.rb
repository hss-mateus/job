class CreateJobPostings < ActiveRecord::Migration[6.1]
  def change
    create_table :job_postings do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
