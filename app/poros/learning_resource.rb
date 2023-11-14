class LearningResource
  attr_reader :id, :country, :video, :images
  #generic absent variables until further Service requirements are known
  def initialize(country)
    @id = nil
    @country = country
    @video = nil
    @images = nil
  end
end