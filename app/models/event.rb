class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title
  field :description
  field :date, type: DateTime
  field :attendees, type: Integer
  field :drinks, type: Integer
  field :registered, type: Integer

  embeds_one :location 
  embeds_many :speakers
end
