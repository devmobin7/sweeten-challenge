class RenovationProject < ApplicationRecord
  has_many :general_contractors
  has_many :contracts

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :min_budget, presence: true
  validates :max_budget, presence: true

  def active_contract
    self.contracts.first
  end
end
