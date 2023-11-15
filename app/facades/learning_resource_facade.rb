class LearningResourceFacade

  def self.fetch_learning_resource(country)
    video = YoutubeService.new.fetch_video(country)
    video_response_body = JSON.parse(video.body, symbolize_names: true)
    video_id = video_response_body[:items].sample || {}

    images = FlickrService.new.fetch_images(country)
    images_response_body = JSON.parse(images.body, symbolize_names: true)
    all_images = images_response_body[:photos][:photo]
    
    resources = LearningResource.new(video_id, all_images, country)
  end

  # refactor for Single Responsibility 
end