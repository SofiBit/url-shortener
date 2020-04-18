module Visits
  def create_visit(ip, link)
    Visit.create(ip: ip, country: get_country(ip), link: link)
  end

  def get_country(ip)
    Geocoder.search(ip).first.country
  end
end
