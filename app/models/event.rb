class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title
  field :description
  field :date, type: DateTime
  field :eventbrite_id, type: Integer

  embeds_one :location
  embeds_many :speakers, :cascade_callbacks => true

  accepts_nested_attributes_for :location, :speakers

  validates_presence_of :date, :eventbrite_id

    def sign_up_count
      eb_auth_tokens = { app_key: ENV['EBAT']}
      eb_client = EventbriteClient.new(eb_auth_tokens)
      response = eb_client.event_get({id: eventbrite_id })
      response["event"]["num_attendee_rows"].to_i
    end


end
