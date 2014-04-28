class EventsController < ApplicationController
  respond_to :html
  before_filter :set_event, :only => [:show]

  def index
    @events = Event.all
    respond_with @events
  end

  def show
    @event = Event.find(set_event)
    @about = About.last
    @message = Message.new

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['T_KEY']
      config.consumer_secret     = ENV['T_SECRET']
      config.access_token        = ENV['TAC']
      config.access_token_secret = ENV['TACS']
    end

    @last_tweet = client.user_timeline("refreshteesside", count: 1).first

    respond_with @event
  end

  protected

   def set_event
     params[:id] ||= Event.last
   end
end
