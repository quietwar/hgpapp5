class EventsController < Devise::OmniauthCallbacksController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    flash[:notice] = 'Event was successfully created.' if @event.save
    respond_with(@event)
  end

  def update
    flash[:notice] = 'Event was successfully updated.' if @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  def redirect
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to hgp_calendars_path
  end

  def calendar_id(schedule)
    response = @client.execute(api_method:
      @service.calendar_list.list)
    calendars = JSON.parse(response.body)
    calendar = calendars["items"].select {|cal|
      cal["id"].downcase == schedule.calendar_id}
    calendar["id"]
  end

  def calendars
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists
  rescue Google::Apis::AuthorizationError
    response = client.refresh!

    session[:authorization] = session[:authorization].merge(response)

    retry
  end

  def hgp_events
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @event_list = service.list_events(params[:calendar_id])
  end

  def new_hgp_event
     client = Signet::OAuth2::Client.new(client_options)
     client.update!(session[:authorization])

     service = Google::Apis::CalendarV3::CalendarService.new
     service.authorization = client

     today = Date.today

     event = Google::Apis::CalendarV3::Event.new({
       start: Google::Apis::CalendarV3::EventDateTime.new(date: today),
       end: Google::Apis::CalendarV3::EventDateTime.new(date: today + 1),
       summary: 'New HGP event!'
     })

     service.insert_event(params[:calendar_id], event)

     redirect_to events_url(calendar_id: params[:calendar_id])
   end

   def google_oauth2
       @user = User.find_for_google_oauth2(request.env["omniauth.auth"])
       if @user
         sign_in @user
         redirect_to root_path
       else
         redirect_to new_user_session_path, notice: 'Access Denied.'
       end
     end

     def make_google_calendar_reservations
      @schedule = @cohort.schedules.find_by(slug:
        params[:slug])
      @calendar = GoogleCalWrapper.new(current_user)
      @calendar.book_rooms(@schedule)
      response = @client.execute(api_method: @service.calendar_list.list)
    end
  private

    def client_options
      {
        client_id: Rails.application.secrets.google_client_id,
        client_secret: Rails.application.secrets.google_client_secret,
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: callback_url
      }
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params[:event]
    end
end
