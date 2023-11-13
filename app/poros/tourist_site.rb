class TouristSite
  attr_reader :id, :name, :formatted, :place_id

    def initialize(attributes = {})
      @name = attributes[:name]
      @formatted = attributes[:formatted]
      @place_id = attributes[:place_id]
      # binding.pry
    end
  end