class TouristSitesSerializer
  include JSONAPI::Serializer
  attributes :name, :formatted, :place_id
end
