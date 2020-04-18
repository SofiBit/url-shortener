class Link < ApplicationRecord
  FORMAT_LINK = /\A(https?:\/\/)?([\w-]{1,32}\.[\w-]{1,32})[^\s@]*/

  scope :sort_by_date, -> { order(created_at: :desc) }

  has_many :visits, dependent: :destroy

  validates_format_of :source_link, with: FORMAT_LINK
  validates :short_url, uniqueness: true
end
 
