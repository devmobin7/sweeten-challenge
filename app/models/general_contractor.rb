class GeneralContractor < ApplicationRecord
  HIGH_CONTRACTORS    = 4.0     # Based on Ranking
  AVERAGE_CONTRACTORS = 1.0     # Based on Ranking
  NEW_CONTRACTORS     = 2       # Based on Total Number of Projects

  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  has_many :contracts, dependent: :destroy
  has_many :renovation_projects, through: :contracts

  scope :search_by_min_budget, -> (min_budget) { where('min_budget <= ?', min_budget) }
  scope :search_by_max_budget, -> (max_budget) { where('max_budget >= ?', max_budget) }
  scope :search_by_design_services, -> (design_services) { where(design_services: design_services) }
  scope :search_by_build_services, -> (build_services) { where(build_services: build_services) }

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :min_budget, presence: true
  validates :max_budget, presence: true
  validates :rating, numericality: true

  def set_new_rating(rating)
    (self.rating + rating) / 2
  end

  def active_contacts
    self.contracts
  end

  def self.search(project)
    contractors = self.by_distance(origin: [project.longitude, project.latitude])
                      .search_by_min_budget(project.min_budget)
                      .search_by_max_budget(project.max_budget)
                      .search_by_design_services(project.design_services)
                      .search_by_build_services(project.build_services)
  end

  def self.rank
    contractors = {}

    high = self.find_by('rating > ?', HIGH_CONTRACTORS)
    contractors[:high] = high if high.present?

    average = self.where('rating <= ?', HIGH_CONTRACTORS).find_by('rating >= ?', AVERAGE_CONTRACTORS)
    contractors[:average] = average if average.present?

    newrecord = self.where('project_count < ?', NEW_CONTRACTORS).find_by('rating < ?', AVERAGE_CONTRACTORS)
    contractors[:new] = newrecord if newrecord.present?

    contractors
  end
end
