class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  enum role: { default: 0, admin: 1 }

  has_many :company_accesses, dependent: :destroy
  has_many :companies, through: :company_accesses
  has_one :resume, dependent: :destroy
  has_many :job_applications, dependent: :destroy

  def applied_for?(job_posting)
    job_applications.exists?(job_posting: job_posting)
  end
end
