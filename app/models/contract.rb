class Contract < ApplicationRecord
  default_scope { where(status: :started) }

  belongs_to :renovation_project
  belongs_to :general_contractor, counter_cache: :project_count

  enum status: [:started, :closed]

  validates :general_contractor_id, presence: true, numericality: true
  validates :renovation_project_id, presence: true, numericality: true
  validates :status, presence: true
  validates :rating, presence: true, numericality: true
end
