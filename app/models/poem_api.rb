class PoemApi
  def fetch_poems(query)
    # q = query.split(" ").join("%20")
    # author_url = "https://poetrydb.org/author/#{q}"
    # author_uri = URI.parse(author_url)
    # author_response = (JSON.parse(Net::HTTP.get_response(author_uri).body))[0..20]


    # title_url = "https://poetrydb.org/title/#{q}"
    # title_uri = URI.parse(title_url)
    # title_response = (JSON.parse(Net::HTTP.get_response(title_uri).body))[0..20]

    # if author_response && title_response
    #   results = (author_response + title_response)
    # elsif author_response && title_response==nil
    #   results = author_response
    # elsif author_response == nil && title_response
    #   results = title_response
    # else
    #   results = []
    # end
    # results
  end

  # def scrape_poems(query)
  #   search_url = "https://www.poetryfoundation.org/search?query=#{query}&refinement=poems"
  #   html = URI.open(search_url)
  #   doc = Nokogiri::HTML(html)
  #   links = (doc.css('.c-feature-hd').css('h2').css('a').collect{|link| link.attribute('href').value})[0..10]
  #   base =  "https://www.poetryfoundation.org"
  #   poem_data = []
  #   links.each do |link|
  #     url = "#{base}#{link}"
  #     html = URI.open(url)
  #     doc = Nokogiri::HTML(html).css('.c-feature')
  #     title = doc.css('.c-feature-hd').css('h1').text.split.join(" ")
  #     author = doc.css('.c-feature-sub').css('span').css('a').text
  #     lines = doc.css('.o-poem').to_html.gsub("<a", "--")
  #     # byebug
  #     if title != "" && author != ""
  #       poem_data << {title: title, author: author, lines: lines}
  #     end
  #   end
  #   poem_data
  # end

  def scrape_poems(query)
    search_url = "https://www.poetryfoundation.org/search?query=#{query}&refinement=poems"
    html = URI.open(search_url)
    doc = Nokogiri::HTML(html)
    # titles = doc.css('.c-feature-hd').collect{|hd| hd.text.split(" ")}.collect{|title|title.join(" ")}
    links = (doc.css('.c-feature-hd').css('h2').css('a').collect{|link| link.attribute('href').value})[0..40]
    # byebug
  end
end