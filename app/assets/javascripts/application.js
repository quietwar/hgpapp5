// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require moment
//= require fullcalendar
//= require fullcalendar/gcal
//= require d3
// require turbolinks
// require underscore
//= require gmaps/google
//= require_tree .


$(document).ready(function() {
   $("#calendar").fullCalendar({
     header:
     left: "prev,next today",
     center: "title",
     right: "month,agendaWeek,agendaDay"
     defaultView: "month",
     height: 500,
     slotMinutes: 15,
     eventSources: ["/events/info"],
     timeFormat: "h:mm t{ - h:mm t} ",
     dragOpacity: "0.5"
  });
});
