class LearningResource
  attr_reader :id, :country, :video, :images

  def initialize(youtube_data, flickr_data, country)
    @id = nil
    @country = country
    @video = youtube_data ? format_video(youtube_data) : {}
    @images = flickr_data ? format_images(flickr_data) : []
  end

  def format_video(youtube_data)
    # binding.pry
    {
      title: youtube_data[:snippet][:title],
      youtube_video_id: youtube_data[:id][:videoId]
    }
  end

  def format_images(flickr_data)
    # binding.pry
    flickr_data.map do |image|
      {
        alt_tag: image[:title],
        url: flickr_url(image)
      }
    end
    # binding.pry
  end

  def flickr_url(image)
    "https://farm#{image[:farm]}.staticflickr.com/#{image[:server]}/#{image[:id]}_#{image[:secret]}.jpg"
  end
end