$(document).ready(function() {
        var initialize calendar;
      initialize_calendar = function(){
        $('#calendar').fullCalendar({
                googleCalendarApiKey: '<secret>',
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaDay',
                    timezone: 'America/Oakland',
                },
                timeFormat: '',
        events: 'hodari@import.calendar.hiddengeniusproject.org',
                timezone: 'Europe/London',
                loading: function(bool) {
                    $('#loading').toggle(bool);

              selectable: true,
              selectHelper: true,
              editable: true,
              eventLimit: true,

      eventClick: function(event, jsEvent, build) {
        $.getScript('/events/new', function(){
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") '+ - +'moment.(end)format("date_range_picker"();
          $('.start_hidden').val(moment(start).format('MM/DD/YYYY HH:mm'));
          $('.end_hidden').val(moment(end).format('MM/DD/YYYY HH:mm'));
        )
      });
      calendar.fullCalendar('unselect');
    },
    eventDrop: function(event, delta, revertFunc)
      event_data = {
        event: {
          id: event.id,
          start: event.start.format(),
          end: event.end.format()
        }
      };
      $.ajax({
        url: event.update_url,
        data: event_data,
        type: 'PATCH'
      });
    },

     {
      $.getScript(event.edit_url function(){
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") '+ - +'moment.(end)format("date_range_picker"();
          $('.start_hidden').val(moment(start).format('MM/DD/YYYY HH:mm'));
          $('.end_hidden').val(moment(end).format('MM/DD/YYYY HH:mm'));

      })
    }
   });
  })
};

//$(document).ready(function()
//    $("#calendar").fullCalendar({
//      header:
//      left: "prev,next today",
//      center: "title",
//      right: "month,agendaWeek,agendaDay"
//      defaultView: "month",
//      height: 500,
//      slotMinutes: 15,
//      events: "/events/get_events",
//      timeFormat: "h:mm t{ - h:mm t} ",
//      dragOpacity: "0.5"
//   });
// });
