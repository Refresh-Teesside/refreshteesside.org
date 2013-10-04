class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :email
  field :body

  validates :email, presence: { message: "We don't see anything here, try entering your email." }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create,
                              message: "This doesn't look like an email.  Do you mind trying again?" }
  validates :body, presence: { message: "We don't see anything here, try entering your message." }
end 