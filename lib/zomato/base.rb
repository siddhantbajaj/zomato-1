
module Zomato
  class Base
    
    def initialize(key)
      @key = key
      Api.headers 'user-key' => key
      Api.headers 'Accept' => 'application/json'
    end
    
    def cities(city)
      puts "here"

     
      @options = { query: { q: city } }
       puts Api.get('/cities',@options).parsed_response
      @cities ||= City.build(Api.get('/cities', @options).parsed_response)
    end
    
    def locality(lat, lon)
      response = Api.get('/geocodes', :query => {:lat => lat, :lon => lon}).parsed_response
      Locality.new(response['location'])
    end
    def location(name)
      response = Api.get('/locations', :query => {:query => name}).parsed_response
       @locations ||=
        response['location_suggestions'].collect do |location|
          Location.new(location)
        end
    end
    
  end
end