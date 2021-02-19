class Event < ApplicationRecord
  has_one_attached :poster
  belongs_to :user
  belongs_to :group
end
