class Event < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode
  belongs_to :user
  has_and_belongs_to_many :eventtypes

  def full_address
    [address, city].compact.join(', ')
  end


  before_save do
    self.eventtype_ids.gsub!(/[\[\]\"]/, "") if attribute_present?("eventtype_ids")
  end

#  validates :name, :start_date, :start_time, :address, :city, :is_paid, :eventtype_ids, presence: true
end
