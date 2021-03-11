class Event < ApplicationRecord
  has_one_attached :poster
  belongs_to :user
  belongs_to :group

  validates :name, :location, :description, :start_time, :end_time, presence: true
  validates :name, uniqueness: {scope: [:start_time, :location, :group_id], message: "Whoops! Did you already create this event?"}, if: Proc.new { |event| event.name.present? }
  validate :validate_start_time, if: Proc.new { |event| event.start_time.present? && event.end_time.present? }
  
  def validate_start_time
    if start_time >= end_time
      errors.add(:start_time, "must be before the end time")
    end
  end

  def poster_url
    Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
  end
end
