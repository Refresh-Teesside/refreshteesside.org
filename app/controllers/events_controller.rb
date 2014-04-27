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

    @last_tweet = client.user_timeline("refreshteesside", count: 1).first

    respond_with @event
  end

  protected

   def set_event
     params[:id] ||= Event.last
   end
end
