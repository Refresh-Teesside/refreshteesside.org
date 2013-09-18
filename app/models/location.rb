class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title
  field :address
  field :postcode
  field :phone
  field :twitter

  embedded_in :event
end
