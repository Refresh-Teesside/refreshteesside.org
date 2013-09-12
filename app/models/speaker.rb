class Speaker
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name
  field :bio
  field :twitter

  embedded_in :event 
end
