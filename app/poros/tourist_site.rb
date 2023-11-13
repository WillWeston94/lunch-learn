class TouristSite
  attr_reader :id, :name, :formatted, :place_id

    def initialize(data)
      @name = data[:properties][:name]
      @formatted = data[:properties][:formatted]
      @place_id = data[:properties][:place_id]
    end
  end