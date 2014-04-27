class Speaker
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Paperclip

  has_mongoid_attached_file :file,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :default_url => "/images/tbc.png",
    :styles => {:small => { :geometry => "100x100"}}

  validates_attachment :file, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  field :name
  field :twitter

  embedded_in :event

end
