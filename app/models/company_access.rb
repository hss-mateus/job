class CompanyAccess < ApplicationRecord
  belongs_to :user
  belongs_to :company

  enum role: { employee: 0, admin: 1 }
end
