module Zomato
  class Collection
    
    attr_reader :id, :name, :city_id
    
    class << self
      def build(response, city_id)
        response["collections"].collect do |collection|
          Collection.new(collection['collection'].merge({'city_id' => city_id}))
        end
      end
    end
    
    def initialize(attributes)
      @collection_id = attributes['collection_id']
      @res_count = attributes['res_count']
      @image_url = attributes['image_url']
      @url = attributes['url']
      @title = attributes['title']
      @description = attributes['description']
      @share_url = attributes['share_url']
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