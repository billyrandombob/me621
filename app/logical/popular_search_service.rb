# queries reportbooru to find popular post searches
class PopularSearchService
  attr_reader :date, :scale

  def initialize(date, scale)
    @date = date
    @scale = scale
  end

  def each_search(&block)
    fetch_data.scan(/\S+/).in_groups_of(2).each(&block)
  end

  def fetch_data
    dates = date.strftime("%Y-%m-%d")

    Cache.get("ps-#{scale}-#{dates}", 1.minute) do
      url = URI.parse("#{Danbooru.config.report_server}/hits/#{scale}?date=#{dates}")
      response = []
      Net::HTTP.start(url.host, url.port, :use_ssl => url.is_a?(URI::HTTPS)) do |http|
        http.read_timeout = 1
        http.request_get(url.request_uri) do |res|
          if res.is_a?(Net::HTTPSuccess)
            response = res.body
          end
        end
      end
      response
    end
  end
end