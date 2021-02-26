class Event < ApplicationRecord
  has_one_attached :poster
  belongs_to :user
  belongs_to :group

  def poster_url
    Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
  end
end
