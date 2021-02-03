class JobPosting < ApplicationRecord
  belongs_to :company
  has_many :job_applications, dependent: :destroy
end
