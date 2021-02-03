class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string :address
      t.string :description
      t.string :experience
      t.string :education
      t.integer :user_id

      t.timestamps
    end

    add_index :resumes, :user_id, unique: true
  end
end
