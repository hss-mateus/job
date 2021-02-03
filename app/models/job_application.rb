class JobApplication < ApplicationRecord
  belongs_to :job_posting
  belongs_to :user

  validates :job_posting_id, uniqueness: { scope: :user_id }
end
