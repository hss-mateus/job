class CreateCompanyAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :company_accesses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :role, null: false, default: 0

      t.timestamps
    end

    add_index :company_accesses, [:user, :company], unique: true
  end
end
