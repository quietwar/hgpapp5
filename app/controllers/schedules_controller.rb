class SchedulesController < ApplicationController

def make_google_calendar_reservations
  @schedule = @cohort.schedules.find_by(slug:
    params[:slug])
  @calendar = GoogleCalWrapper.new(current_user)
  @calendar.book_rooms(@schedule)
end

class GoogleCalendarWrapper

  def initialize(current_user)
    configure_client(current_user)
  end

  def configure_client(current_user)
    @client = Google::APIClient.new
    @client.authorization.access_token = current_user.token
    @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    @client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
    response = @client.execute(api_method: @service.calendar_list.list)
  end



  def calendar_id(schedule)
    response = @client.execute(api_method:
      @service.calendar_list.list)
    calendars = JSON.parse(response.body)
    calendar = calendars["items"].select {|cal|
      cal["id"].downcase == schedule.calendar_id}
    calendar["id"]
  end

  # @client.execute(api_method: @service.freebusy.query,
  #   body: JSON.dump({timeMin: start_time,
  #   timeMax: end_time,
  #   timeZone: "EST",
  #   items: [calendar_id]}),
  #   headers: {'Content-Type' => 'application/json'})

    # @client.execute(:api_method => @service.events.insert,
    #   :parameters => {'calendarId' => calendar_id,
    #     'sendNotifications' => true},
    #   :body => JSON.dump(event),
    #   :headers => {'Content-Type' => 'application/json'})
    #
    #   event = {
    #     summary: "Board of Directors Meeting",
    #     location: "Conference Room - 1",
        # start: {dateTime: 2016-03-20T11:04:00+0000},
        # end: {dateTime: 2016-03-20T12:04:00+0000},
        # description: "important meeting with the board",
      #}
  end
end
