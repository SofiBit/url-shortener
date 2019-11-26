class Link < ApplicationRecord
  after_create_commit { encode(id) }

  private

  def encode(id)
    update(short_url: ENV['HOST'] + EncodeLink.new(id).encode)
  end
end
