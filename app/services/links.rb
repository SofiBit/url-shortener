module Links
  def link_exist?(url)
    search_link(url).present?
  end

  def link_new?(url)
    search_link(url).nil?
  end

  def search_link(url)
    Link.find_by(source_link: url)
  end

  def encode(url)
    start_number = 8
    finish_number = 15
    result = ''
    loop do
      counter = 1
      result = Digest::SHA1.hexdigest(url.to_s)[start_number..finish_number]
      break if short_url_unique?(result) || counter == 5

      finish_number += 1
      counter += 1
    end
    result
  end

  def short_url_unique?(result)
    link = Link.find_by(short_url: result)

    link.nil?
  end
end
