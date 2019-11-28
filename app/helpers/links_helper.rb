module LinksHelper
  def short_url(short)
    ENV['APP_HOST'] + short
  end
end
