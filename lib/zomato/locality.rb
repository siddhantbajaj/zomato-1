module Zomato
  class Locality
    
    attr_reader :city_name, :city_id,:entity_type,:entity_id,:title,:country_name
    
    def initialize(attributes)
      
      @city_name = attributes['city_name']
      @city_id = attributes['city_id']
      @entity_type = attributes['entity_type']
      @entity_id = attributes['entity_id']
      
      @title=attributes['title']
      @country_name=attributes['country_name']
    end
    
  end
end