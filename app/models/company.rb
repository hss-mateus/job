class Company < ApplicationRecord
  validates :name, :subdomain, presence: true
  validates :subdomain, uniqueness: true

  has_many :company_accesses, dependent: :destroy
  has_many :users, through: :company_accesses

  has_many :job_postings, dependent: :destroy
  has_many :job_applications, through: :job_postings
end
