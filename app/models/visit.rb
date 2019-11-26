class Visit < ApplicationRecord
  belongs_to :link

  scope :count_from_country, ->(country) { where(country: country).count }
end
