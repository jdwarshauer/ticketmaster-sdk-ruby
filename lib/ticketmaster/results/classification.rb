module Ticketmaster
  class Classification < Result
    def id
      data['id'] || data['segment']['id']
    end

    def name
      data['name'] || data['segment']['name']
    end

    def genres
      data['genre']['name'] if data['genre'].present?
    end

    def subgenres
      data['subGenre']['name'] if data['subGenre'].present?
    end

    def type
      data['_links']['self']['href'].match(/(?<=\/discovery\/v\d\/)[a-z\/]+(?=\/)/)[0]
    end

    def reload
      data = request.client.get_classification(id, type).data
      self
    end
  end
end
