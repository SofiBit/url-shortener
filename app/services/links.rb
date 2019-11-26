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
end