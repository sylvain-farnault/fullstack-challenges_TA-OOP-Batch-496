class ScrapeMarmitonService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # TODO: return a list of `Recipes` built from scraping the web.
    # results will be an array of recipe instances
    results = []
    #  ...
    url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{@keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.search('.recipe-card').first(5).each do |element|
      name = element.search('.recipe-card__title').text.strip
      description = element.search('.recipe-card__description').text.strip
      rating = element.search('.recipe-card__rating__value').text.strip
      results.push(Recipe.new(name, description, rating))
    end
    results
  end
end
