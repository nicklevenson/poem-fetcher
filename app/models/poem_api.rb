class PoemApi
  def fetch_poems(query)
    q = query.split(" ").join("%20")
    author_url = "https://poetrydb.org/author/#{q}"
    author_uri = URI.parse(author_url)
    author_response = (JSON.parse(Net::HTTP.get_response(author_uri).body))[0..10]


    title_url = "https://poetrydb.org/title/#{q}"
    title_uri = URI.parse(title_url)
    title_response = (JSON.parse(Net::HTTP.get_response(title_uri).body))[0..20]

    if author_response && title_response
      results = (author_response + title_response)
    elsif author_response && title_response==nil
      results = author_response
    elsif author_response == nil && title_response
      results = title_response
    else
      results = nil
    end
    results

  end
end