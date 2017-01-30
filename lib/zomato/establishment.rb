module Zomato
  class Establishment
    
    attr_reader :id, :name, :city_id
    
    class << self
      def build(response, city_id)
        response["establishments"].collect do |collection|
          Establishment.new(collection['establishment'].merge({'city_id' => city_id}))
        end
      end
    end
    
    def initialize(attributes)
      @id = attributes['id']
      @name = attributes['name']
      @city_id = attributes['city_id'].to_i
    end
    
    def restaurants(query = {})
      query = {
        :city_id    => city_id,
        :cuisine_id => id
      }.merge(query)
      response = Api.get('/search', :query => query).parsed_response
      Restaurant.build(response, query)
    end
    
  end
end