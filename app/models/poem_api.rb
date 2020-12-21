class PoemApi
  def fetch_poems(query)
    author_url = "https://poetrydb.org/author/#{query}"
    author_uri = URI.parse(author_url)
    author_response = (JSON.parse(Net::HTTP.get_response(author_uri).body))[0..10]

    title_url = "https://poetrydb.org/title/#{query}"
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