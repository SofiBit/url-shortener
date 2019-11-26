class Link < ApplicationRecord
  FROMAT_LINK = /\A(https?:\/\/)?([\w-]{1,32}\.[\w-]{1,32})[^\s@]*/

  after_create_commit { encode(id) }

  validates_format_of :source_link, with: FROMAT_LINK
  validates :source_link, presence: true

  private

  def encode(id)
    update(short_url: ENV['HOST'] + EncodeLink.new(id).encode)
  end
end
