module VisitsHelper
  def count_country(visits, country)
    visits.count_from_country(country)
  end

  def countries(visits)
    visits.each_with_object({}) do |visit, hash|
      hash[visit.country] = count_country(visits, visit.country)
    end
  end
end
